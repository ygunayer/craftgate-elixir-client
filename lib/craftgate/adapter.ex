defmodule Craftgate.Adapter do
  @moduledoc """
  Represents an adapter that can be used to interact with a group of related endpoints.

  Contains the `endpoint/2` macro which can be used to quickly declare methods to access the said endpoints.

  To import this macro simply use the `Craftgate.Adapter` module in your module, e.g.:

  ```elixir
  defmodule MyAdapter do
    use Craftgate.Adapter

    endpoint retrieve_foo(id: integer()), get: "/foo/v1/foos/:id", return: FooResponse
  end
  ```
  """

  defmacro __using__(_) do
    quote do
      import Craftgate.Adapter, only: [endpoint: 2, serializable_struct_from_typespec: 1]

      @path_param_regex ~r/\:[\w\d\_]+/
    end
  end

  @doc """
  Declares a method pair that can be used to execute a request against the specified endpoint.

  Of the generated methods, one carries over the specified name as-is and returns an OK/error tuple with the
  desired response type (e.g. `{:ok, %Craftgate.Response.PaymentResponse{...}}` or `{:error, %Craftgate.Error{...}}`),
  and the other contains its "bangified" implementation, which either raises an error or returns the desired type.

  Both methods will have their typespecs declared automatically, and the un-bangified method will retain its `@doc` statement.

  Also, both methods will have an additional, optional parameter in the end called `options` which can be used to specify
  custom options on a particular request.

  So to retrieve a resource of type `Foo` with the given ID and parse it as a `FooResponse` you can do:

  ```elixir
  defmodule FooAdapter do
    use Adapter

    endpoint retrieve_foo(id: integer()), get: "/foo/v1/foos/:id", return: FooResponse
  end
  ```

  Which then gets expanded to the following Elixir code
  ```elixir
  @spec retrieve_foo(integer(), keyword()) :: {:ok, FooResponse} | {:error, any()}
  def retrieve_foo(id, options \\\\ []) do
    ...
  end

  @doc "Bangified version of the method with the same name\n"
  @spec retrieve_foo!(integer(), keyword()) :: FooResponse | no_return
  def retrieve_foo!(id, options \\\\ []) do
    ...
  end
  ```

  Note that arguments are specified as a keyword list where the keys represent the argument names (which can then be expanded into
  the URL via the `:<arg_name>` syntax) and the values represent the types of each argument, the HTTP method and the destination
  URL are specified by the `get: "..."` options, and the expected successful response type is specified as the `return` option.

  Which will allow you to call the `FooAdapter.retrieve_foo/1` method like this:

  ```elixir
  # retrieving the result as a tuple
  {:ok, %FooResponse{...}} = FooAdapter.retrieve_foo(42)

  # or having the errors be raised
  %FooResponse{...} = FooAdapter.retrieve_foo!(42)
  ```

  Note that in both cases, the argument `id` will be expanded into the `:id` path segment specified in the URL and the `get` key will
  expand into the HTTP method `GET`, so in the end a `GET` request will be sent to `/foo/v1/foos/42`. Once the request executes, successful
  results will be parsed as the struct `FooResponse`, and failed results will be parsed as `Craftgate.Error`.

  Similarly, the `body` argument will be expanded into the request body, so to create a `Foo` we can declare:

  ```elixir
  defmodule FooAdapter do
    ...

    endpoint create_foo(body: CreateFooRequest.t()), post: "/foo/v1/foos", return: FooResponse.t()
  end
  ```

  Which in turn can be called like as follows:

  ```elixir
  {:ok, foo_response} = FooAdapter.create_foo(%CreateFooRequest{...})
  ```

  Similarly, the `params` argument will be expanded into the query string:

  ```elixir
  defmodule FooAdapter do
    ...

    endpoint search_foos(params: keyword()), get: "/foo/v1/foos", return: SearchFoosResponse.t()
  end
  ```

  ```elixir
  %{items: foos} = FooAdapter.search_foos!(name: "foo", age: 42)
  ```

  You can also use function blocks in the options to specify custom request parameter or bodies. Note that these functions will have the same arity
  as the original definition and will receive the exact same arguments as the ones passed into the function call.

  This can be particularly useful to providing convenience methods to consumers without expecting them to construct full request bodies.

  ```elixir
  ...
  endpoint set_foo_status(id: integer(), status: FooStatus.t()),
    put: "/foos/v1/foos/:id/status",
    body: fn _, status -> %UpdateFooStatusRequest{new_status: status} end
  ...
  ```

  Finally, the `return` option can be left out to capture empty responses while still being able to identify failures as `Craftgate.Error` structs.
  This can be particularly useful for DELETE endpoints which typically return an empty response body.

  So in the end, a set of CRUD operations for a resource `Foo` can easily be declares as follows:

  ```elixir
  defmodule FooAdapter do
    use Adapter

    endpoint create_foo(body: CreateFooRequest.t()), post: "/foo/v1/foos", return: FooResponse.t()
    endpoint retrieve_foo(id: integer()), get: "/foo/v1/foos/:id", return: FooResponse.t()
    endpoint update_foo(id: integer(), body: UpdateFooRequest.t()), put: "/foo/v1/foos/:id", return: FooResponse.t()
    endpoint set_foo_status(id: integer(), status: FooStatus.t()),
      put: "/foos/v1/foos/:id/status",
      body: fn _, status -> %UpdateFooStatusRequest{new_status: status} end
    endpoint delete_foo(id: integer()), delete: "/foo/v1/foos/:id"
    endpoint search_foos(params: keyword()), get: "/foo/v1/foos", return: SearchFoosResponse.t()
  end
  ```
  """
  defmacro endpoint({method_name, _, macro_args}, opts) do
    args =
      case macro_args do
        [args] -> args
        _ -> []
      end

    arg_names = Keyword.keys(args) |> Enum.map(fn arg_name -> arg_name |> Atom.to_string() end)
    arg_refs = Keyword.keys(args) |> Enum.map(&Macro.var(&1, __MODULE__))
    arg_types = Keyword.values(args)

    arg_types = arg_types ++ [quote(do: keyword())]
    passed_args = arg_refs ++ [Macro.var(:options, __MODULE__)]
    method_args = arg_refs ++ [quote(do: options \\ [])]

    {http_method, url} =
      [:get, :post, :put, :delete, :head, :index]
      |> Enum.map(fn method -> {method, opts[method]} end)
      |> Enum.find(nil, fn
        {_, nil} -> false
        {_, _} -> true
      end)

    request_body = arg_or_opt_block(args, opts, :body, arg_refs)
    request_params = arg_or_opt_block(args, opts, :params, arg_refs)

    return_type = case opts[:return] do
      nil -> quote(do: :void)
      other -> other
    end

    return_struct = Macro.expand(quote do
      serializable_struct_from_typespec unquote(return_type)
    end, __CALLER__)

    bang_method_name = String.to_atom(Atom.to_string(method_name) <> "!")
    bang_method_docs = {:@, [context: Elixir, imports: [{1, Kernel}]], [{:doc, [context: Elixir], ["Bangified version of `#{method_name}/#{Enum.count(method_args)}`"]}]}

    quote generated: true do
      @spec unquote(method_name)(unquote_splicing(arg_types)) :: {:ok, unquote(return_type)} | {:error, any()}
      def unquote(method_name)(unquote_splicing(method_args)) do
        args =
          [unquote_splicing(arg_names)]
          |> Enum.zip([unquote_splicing(passed_args)])
          |> Map.new()

        actual_url = case unquote(url) do
          fun when is_function(fun) ->
            fun.(unquote_splicing(passed_args))

          url ->
            @path_param_regex
            |> Regex.scan(url)
            |> Enum.flat_map(&Function.identity/1)
            |> Enum.map(fn ":" <> name -> name end)
            |> Enum.filter(&Map.has_key?(args, &1))
            |> Enum.reduce(url, fn name, acc ->
              String.replace(acc, ":" <> name, to_string(args[name]))
            end)
        end

        body = unquote(request_body)

        request_data = Keyword.merge(options, [
          method: unquote(http_method),
          url: actual_url,
          params: unquote(request_params),
          body: body,
        ])

        case Craftgate.Config.get() do
          {:ok, config} ->
            request_data
            |> Craftgate.HttpClient.execute(config)
            |> Craftgate.Serializable.parse(unquote(return_struct))

          {:error, error} -> {:error, error}
        end
      end

      unquote(bang_method_docs)
      @spec unquote(bang_method_name)(unquote_splicing(arg_types)) :: unquote(return_type) | no_return
      def unquote(bang_method_name)(unquote_splicing(method_args)), do: unquote(method_name)(unquote_splicing(passed_args)) |> Craftgate.Utils.bangify!()
    end
  end

  @doc false
  def arg_or_opt_block(args, opts, key, arg_refs) do
    case {opts[key], args[key]} do
      {nil, nil} -> quote(do: nil)
      {{:fn, _, _} = function, nil} -> quote(do: unquote(function).(unquote_splicing(arg_refs)))
      {{:&, _, _} = function, nil} -> quote(do: unquote(function).(unquote_splicing(arg_refs)))
      {nil, _} -> Macro.var(key, __MODULE__)
    end
  end

  @doc false
  defmacro serializable_struct_from_typespec({{:., _, [{:__aliases__, _, _} = module_alias, :t]}, _, _}) do
    resolved_module = Macro.expand(module_alias, __CALLER__)
    {:__aliases__, [alias: false], resolved_module}
  end

  @doc false
  defmacro serializable_struct_from_typespec(:void), do: nil

  defmacro serializable_struct_from_typespec(other), do: other
end
