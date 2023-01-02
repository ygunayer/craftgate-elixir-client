defmodule CraftgateTest.Support.TestAdapter do
  @moduledoc """
  This module can be `use`d to enhance the developer experience when writing tests for adapters.any()

  When `use`d, this module will inject the following to the using module:
  - `use` directive for `ExUnit.Case` with `async: true`
  - `import` directives for the module `Mox` and the `CraftgateTest.Support.TestAdapter.test_endpoint/2` macro
  - Module attributes in the form of `@fixture_<filename>` for each `*.json` file placed under `test/fixtures/adapter/<adapter_name>/<filename>.json`
  """

  defmacro __using__(_) do
    quote do
      use ExUnit.Case

      import Mox
      import CraftgateTest.Support.TestAdapter, only: [test_endpoint: 2]

      CraftgateTest.Support.TestAdapter.__fixtures__(unquote(__CALLER__))

      setup :reset_config

      @mock_api_key "mock-api-key"
      @mock_secret_key "mock-secret-key"
      @mock_base_url "http://api.craftgate.mock"

      def reset_config(_) do
        Application.delete_env(:craftgate_test, :api_key)
        Application.delete_env(:craftgate_test, :secret_key)
        Application.delete_env(:craftgate_test, :base_url)
        Application.delete_env(:craftgate_test, :lang)
        Application.delete_env(:craftgate_test, :request_options)

        Application.put_env(:craftgate_test, :api_key, @mock_api_key)
        Application.put_env(:craftgate_test, :secret_key, @mock_secret_key)
        Application.put_env(:craftgate_test, :base_url, @mock_base_url)
      end
    end
  end

  defmacro __fixtures__(%Macro.Env{module: module}) do
    module_path =
      module
      |> Atom.to_string()
      |> String.trim_leading("Elixir.CraftgateTest.")
      |> Macro.underscore()
      |> String.trim_trailing("_test")

    root_path = "test/fixtures/" <> module_path

    Module.register_attribute(module, :fixtures_root, accumulate: false)
    Module.put_attribute(module, :fixtures_root, root_path)

    files = if File.dir?(root_path), do: File.ls!(root_path), else: []

    files
    |> Enum.filter(&String.ends_with?(&1, ".json"))
    |> Enum.each(fn file ->
      fixture_name = String.to_atom("fixture_#{Path.rootname(file)}")
      Module.register_attribute(module, fixture_name, accumulate: false)

      contents = File.read!(Path.join(root_path, file))
      Module.put_attribute(module, fixture_name, contents)
    end)
  end

  @doc """
  A macro that can be used to quickly declare a `test` directive with proper `Mox` mocks against `HTTPoison.request/4`

  Note that the `when` option is captured as an expression and is therefore lazily evaluated when the test is run.

  ```elixir
  defmodule FooAdapterTest do
    use CraftgateTest.Support.TestAdapter

    describe "FooAdapter" do
      test_endpoint(
        "retrieve_foo/1",
        when: FooAdapter.retrieve_foo(42),
        expect: [
          get: "/foo/v1/foos/42"
        ]
      )

      test_endpoint(
        "create_foo/1",
        when: FooAdapter.create_foo(%CreateFooRequest{...}),
        expect: [
          post: "/foo/v1/foos",
          # Assuming `test/fixtures/adapter/foo_adapter/request_create_foo.json` exists, `@fixture_request_create_foo` will be created by `TestAdapter`
          body: @fixture_request_create_foo
        ]
      )
    end
  end
  ```
  """
  defmacro test_endpoint(test_name, opts) do
    expect = opts[:expect]
    block = opts[:when]
    response = Keyword.get(opts, :respond_with, quote(do: {:ok, ""}))

    {expected_method, expected_url} =
      [:get, :post, :put, :delete, :head, :index]
      |> Enum.map(fn method -> {method, expect[method]} end)
      |> Enum.find(nil, fn
        {_, nil} -> false
        {_, _} -> true
      end)

    expected_body_expr =
      case expect[:body] do
        nil -> quote(do: nil)
        expr -> expr
      end

    test_name =
      quote(
        do:
          "#{unquote(test_name)} should send a #{unquote(expected_method)} request to #{unquote(expected_url)}"
          |> String.slice(0, 100)
      )

    quote do
      test unquote(test_name) do
        MockHTTPoison
        |> expect(:request, fn method, url, body, headers, request_options ->
          assert unquote(expected_method) == method
          assert "#{@mock_base_url}#{unquote(expected_url)}" == url

          case unquote(expected_body_expr) do
            nil ->
              assert "" == body

            other ->
              expected_body =
                other
                |> Craftgate.Serializable.serialize!()
                |> Jason.decode!()

              assert expected_body == Jason.decode!(body)
          end

          unquote(response)
        end)

        assert unquote(block)
      end
    end
  end
end
