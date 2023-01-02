defmodule Craftgate.Serializable do
  @moduledoc """
  The module that contains macros to declare typed structs that can be serialized and deserialized easily and in a recursive
   fashion, and has the necessary typespecs declared for developer assistance and compile-time type checking for Dialyzer.

  Under the hood, uses `Construct` to declare the typed fields. See the [Construct documentation](https://hexdocs.pm/construct/readme.html)
  to see how to specify the types.

  To declare a struct, simply `use` the `Craftgate.Serializable` module and specify the list of fields as a keyword list
  where the keys represent the field names and values represent the types of those fields.

  Make sure to specify the field names as `:snake_case` atoms to follow Elixir conventions and don't worry about serialization
  or deserialization as they will be converted into `"camelCase"` keys (or vice-versa) during conversion.

  Example usage:

  ```elixir
  defmodule Craftgate.Request.Dto.FraudCheckParameters do
    use Craftgate.Serializable, [
      buyer_external_id: :string,
      buyer_phone_number: :string,
      buyer_email: :string
    ]
  end
  ```
  """

  defmacro __using__(fields) do
    quote bind_quoted: [fields: fields] do
      use Construct, enforce_keys: false

      structure do
        for {name, type} <- fields do
          Craftgate.Serializable.__field__(name, type)
        end
      end

      @doc """
      Returns the names of the fields that are serializable/deserializable
      """
      @spec serializable_fields() :: [atom()]
      def serializable_fields(), do: [unquote_splicing(fields |> Keyword.keys())]

      @doc """
      Attempts to parse the input as an instance of this struct

      See also: `Craftgate.Serializable.parse/2`
      """
      @spec parse(any()) :: {:ok, __MODULE__.t()} | {:error, any()}
      def parse(data), do: Craftgate.Serializable.parse(data, __MODULE__)

      @doc """
      Bangified version of `parse/1`
      """
      @spec parse!(any()) :: __MODULE__.t() | no_return()
      def parse!(data), do: Craftgate.Serializable.parse!(data, __MODULE__)

      @doc """
      Attempts to serialize this struct as a JSON string
      """
      @spec serialize(__MODULE__.t(), keyword()) :: {:ok, binary()} | {:error, any()}
      def serialize(%__MODULE__{} = self, opts \\ []), do: Jason.encode(self, opts)

      @doc """
      Bangified version of `serialize/2`
      """
      @spec serialize!(__MODULE__.t()) :: binary() | no_return()
      def serialize!(%__MODULE__{} = self, opts \\ []), do: Jason.encode!(self)

      defimpl Jason.Encoder, for: __MODULE__ do
        def encode(self, opts) do
          @for.serializable_fields()
          |> Enum.reduce(%{}, fn k, acc ->
            case get_in(self, [Access.key(k)]) do
              nil -> acc
              val -> Map.put(acc, Recase.to_camel(k), val)
            end
          end)
          |> Jason.Encoder.encode(opts)
        end
      end
    end
  end

  defmacro __field__(name, type) do
    quote do
      field(unquote(name), unquote(type), default: nil)
    end
  end

  @doc """
  Attempts to parse successful inputs as the given type `as`, or erronous inputs into an instance of `Craftgate.Error` and result as an OK or error tuple.

  The behavior of this method will branch into several possibilities depending on the structure of the input,
  as well as the value of the `as` parameter. Below is a list of all possibilities in order of preference.

  * If `input` is an error tuple (e.g. `{:error, ...}`) it returns the tuple immediately
  * If `input` is an OK tuple (e.g. `{:ok, ...}`) it proceeds to parse the second element of the tuple
  * If `input` is an `HTTPoison.Response` instance with a `status_code` between `200` and `300`, it proceeds to parse the `body` of the response object
  * If `input` is an `HTTPoison.Response` instance with a different status code, it attempts to parse `"errors"` property of the response data into an instance of `Craftgate.Error`
  * If `as` is `:void`, it returns `{:ok, nil}`
  * If `as` is `String` and the `input` is a string, it returns the input in an OK tuple (e.g. `{:ok, input}`)
  * If `input` is a string, it parses the input as a map and tries to convert it into an instance of `as`
  * If `input` is a map with an `"errors"` element, it tries to parse the error data into an instance of `Craftgate.Error`
  * If `input` is a map with a `"data"` element, it tries to parse the `"data"` key into an instance of `as`, where:
    * If `as` is `:map`, it returns the data in an OK tuple (e.g. `{:ok, data}`)
    * If `as` is an atom, it converts the keys of the map into `:snake_case` atoms, and attempts to convert the resulting map into an instance of `as` using `Construct.Cast.make/3`
  """
  @spec parse(any(), atom()) :: {:ok, any()} | {:error, any()}
  def parse({:ok, response_body}, as), do: parse(response_body, as)

  def parse({:error, _} = error, _), do: error

  def parse(%HTTPoison.Response{body: body, status_code: status_code}, as) when status_code >= 200 and status_code < 300, do: parse(body, as)

  def parse(%HTTPoison.Response{body: body}, as) do
    case Jason.decode(body) do
      {:ok, %{"errors" => errors}} -> {:error, parse_errors(errors)}
      other -> parse(other, as)
    end
  end

  def parse(_, :void), do: {:ok, nil}

  def parse(raw, :raw) when is_binary(raw), do: {:ok, :erlang.binary_to_list(raw)}
  def parse(json, String) when is_binary(json), do: {:ok, json}

  def parse(json, as) when is_binary(json) do
    case Jason.decode(json) do
      {:ok, map} -> parse(map, as)
      {:error, error} -> {:error, error}
    end
  end

  def parse(%{"data" => data}, as), do: parse(data, as)

  def parse(%{"errors" => errors}, _), do: {:error, parse_errors(errors)}

  def parse(map, :map) when is_map(map), do: {:ok, map}

  def parse(map, as) when is_map(map) and is_atom(as) do
    map
    |> Recase.Enumerable.convert_keys(&Recase.to_snake/1)
    |> as.make()
  end

  def parse(other, _), do: {:error, "Failed to parse response #{inspect(other)}"}

  @doc """
  Bangified version of `parse/2`
  """
  @spec parse!(any(), atom()) :: any() | no_return()
  def parse!(response, as), do: parse(response, as) |> Craftgate.Utils.bangify!()

  defp parse_errors(
         %{"errorCode" => error_code, "errorDescription" => error_description} = errors
       ) do
    error_group =
      case errors["errorGroup"] do
        nil -> nil
        group when is_binary(group) -> String.to_atom(group)
        group -> group
      end

    %Craftgate.Error{code: error_code, description: error_description, group: error_group}
  end

  @doc """
  Serializes the given input into an OK or error tuple containing a JSON string using `Jason.encode/2`
  """
  @spec serialize(any()) :: {:ok, binary()} | {:error, any()}
  def serialize(nil), do: {:ok, ""}
  def serialize(body) when is_binary(body), do: {:ok, body}
  def serialize(body) when is_struct(body) or is_map(body), do: body |> normalize() |> Jason.encode()

  @doc """
  Bangified version of `serialize/1`
  """
  @spec serialize!(any()) :: binary() | no_return()
  def serialize!(data), do: data |> serialize() |> Craftgate.Utils.bangify!()

  defp normalize(struct) when is_struct(struct) do
    should_convert_to_map =
      case Jason.Encoder.impl_for(struct) do
        Jason.Encoder.Any -> true
        nil -> true
        _ -> false
      end

    unless should_convert_to_map do
      struct
    else
      struct
      |> Map.keys()
      |> Enum.reduce(%{}, fn
        :__struct__, acc -> acc

        k, acc ->
          case get_in(struct, [Access.key!(k)]) do
            nil -> acc
            v -> Map.put(acc, Recase.to_camel(k), normalize(v))
          end
      end)
    end
  end

  defp normalize(map) when is_map(map) do
    map
    |> Enum.reduce(%{}, fn
      {_, v}, acc when is_nil(v) ->
        acc

      {k, v}, acc ->
        Map.put(acc, Recase.to_camel(k), normalize(v))
    end)
  end

  defp normalize(other), do: other
end
