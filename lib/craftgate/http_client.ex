defmodule Craftgate.HttpClient do
  @moduledoc """
  The module responsible for sending requests to Craftgate API

  Uses `HTTPoison` in the background to execute requests and the `Craftgate.Serializable` module to encode/decode requests and responses
  """

  alias Craftgate.Utils

  @header_api_key :"x-api-key"
  @header_rnd_key :"x-rnd-key"
  @header_signature :"x-signature"
  @header_auth_version :"x-auth-version"
  @header_client_version :"x-client-version"
  @header_lang :lang
  @header_content_type :"content-type"

  @content_type_json "application/json"
  @auth_version "1"

  @http_adapter Application.compile_env(:craftgate, :http_adapter, HTTPoison)

  @type method :: :get | :post | :put | :patch | :delete | :options | :head
  @type url :: URI.t()
  @type body :: term()
  @type params :: keyword()
  @type headers :: keyword()
  @type request_options :: HTTPoison.options()

  @type execute_options :: [
    method: method(),
    url: url(),
    lang: binary() | nil,
    body: body() | nil,
    params: params() | nil,
    headers: headers() | nil,
    request_options: request_options() | nil
  ]

  @type success_result ::  {:ok, HTTPoison.Response.t() | HTTPoison.AsyncResponse.t() | HTTPoison.MaybeRedirect.t()}
  @type error_result :: {:error, any()}

  @doc """
  Convenience method to get the current Craftgate configuration and execute a `HEAD` request
  """
  @spec head!(url(), params(), [lang: binary() | nil, headers: headers() | nil, request_options: request_options() | nil]) :: success_result() | no_return()
  def head!(url, params \\ [], additional_options \\ []), do: additional_options |> Keyword.merge([method: :head, url: url, params: params]) |> execute(Craftgate.Config.get!()) |> Utils.bangify!()

  @doc """
  Convenience method to get the current Craftgate configuration and execute a `GET` request
  """
  @spec get!(url(), params(), [lang: binary() | nil, headers: headers() | nil, request_options: request_options() | nil]) :: success_result() | no_return()
  def get!(url, params \\ [], additional_options \\ []), do: additional_options |> Keyword.merge([method: :get, url: url, params: params]) |> execute(Craftgate.Config.get!()) |> Utils.bangify!()

  @doc """
  Convenience method to get the current Craftgate configuration and execute a `PUT` request
  """
  @spec put!(url(), body() | nil, [lang: binary() | nil, headers: headers() | nil, request_options: request_options() | nil]) :: success_result() | no_return()
  def put!(url, body \\ nil, additional_options \\ []), do: additional_options |> Keyword.merge([method: :put, url: url, body: body]) |> execute(Craftgate.Config.get!()) |> Utils.bangify!()

  @doc """
  Convenience method to get the current Craftgate configuration and execute a `POST` request
  """
  @spec post!(url(), body() | nil, [lang: binary() | nil, headers: headers() | nil, request_options: request_options() | nil]) :: success_result() | no_return()
  def post!(url, body \\ nil, additional_options \\ []), do: additional_options |> Keyword.merge([method: :post, url: url, body: body]) |> execute(Craftgate.Config.get!()) |> Utils.bangify!()

  @doc """
  Convenience method to get the current Craftgate configuration and execute a `PATCH` request
  """
  @spec patch!(url(), body() | nil, [lang: binary() | nil, headers: headers() | nil, request_options: request_options() | nil]) :: success_result() | no_return()
  def patch!(url, body \\ nil, additional_options \\ []), do: additional_options |> Keyword.merge([method: :patch, url: url, body: body]) |> execute(Craftgate.Config.get!()) |> Utils.bangify!()

  @doc """
  Convenience method to get the current Craftgate configuration and execute a `DELETE` request
  """
  @spec delete!(url(), params(), [lang: binary() | nil, headers: headers() | nil, request_options: request_options() | nil]) :: success_result() | no_return()
  def delete!(url, params \\ [], additional_options \\ []), do: additional_options |> Keyword.merge([method: :delete, url: url, params: params]) |> execute(Craftgate.Config.get!()) |> Utils.bangify!()

  @doc """
  Executes a request against Craftgate API with the given properties

  The list of options that can be passed in the `options` keyword list are as follows:
  * `:method` - (Required) The HTTP method to send with the request
  * `:url` - (Required) The path or the relative URL to send the request to
  * `:params` - (Optional) The keyword list of query parameters to append to the URL. Will default to the empty list `[]`
  * `:body` - (Optional) The body to send the request with. Will default to `nil`
  * `:lang` - (Optional) The language to send the request with. Whe default language from the configuration will be used
  * `:headers` - (Optional) The list of additional headers to send the request with. Will default to the empty list `[]`. Built-in headers (`x-api-key`, `x-auth-version`, `x-signature`, `lang`, etc.) will be overridden with the calculated values
  * `:request_options` - (Optional) The keyword list of request options to specify to `HTTPoison`. Will default to the empty list `[]`. Refer to `HTTPoison.options/3` for more details.
  """
  @spec execute(execute_options(), Craftgate.Config.t()) :: success_result() | error_result()
  def execute(options, %Craftgate.Config{} = config) do
    method_and_url =
      case Keyword.take(options, [:method, :url]) do
        [method: method, url: url] -> {:ok, {method, url}}
        _ -> {:error, "Request method and URL must both be defined"}
      end

    with {:ok, {method, url}} <- method_and_url,
         {:ok, serialized_request_body} <- Craftgate.Serializable.serialize(options[:body])
    do
      params = Keyword.get(options, :params, [])
      full_url = prepare_url(config.base_url, url, params) |> URI.to_string()

      random_key = Utils.random_str()
      lang = Keyword.get(options, :lang, config.lang)
      signature = Utils.calculate_signature(config.api_key, config.secret_key, full_url, random_key, serialized_request_body)

      custom_headers = Keyword.get(options, :headers, [])
      headers =
        Keyword.put([], @header_content_type, @content_type_json)
        |> Keyword.merge(custom_headers)
        |> Keyword.put(@header_api_key, config.api_key)
        |> Keyword.put(@header_rnd_key, random_key)
        |> Keyword.put(@header_auth_version, @auth_version)
        |> Keyword.put(@header_client_version, Craftgate.client_version())
        |> Keyword.put(@header_lang, lang)
        |> Keyword.put(@header_signature, signature)

      request_options = Keyword.merge(
        config.request_options,
        Keyword.get(options, :request_options, [])
      )

      @http_adapter.request(
        method,
        full_url,
        serialized_request_body,
        headers,
        request_options
      )
    else
      {:error, error} -> {:error, error}
    end
  end

  defp prepare_url(base_url, path, query_params) when is_struct(query_params) do
    params_as_map =
      query_params
      |> Craftgate.Serializable.serialize!()
      |> Jason.decode!()
    prepare_url(base_url, path, params_as_map)
  end

  defp prepare_url(base_url, path, query_params) do
    uri = URI.merge(base_url, path)

    if Utils.is_empty?(query_params) do
      uri
    else
      query_string =
        query_params
        |> Enum.sort_by(fn {k, _} -> k end)
        |> Enum.map(fn
          {k, values} when is_list(values) ->
            comma_separated = Enum.join(values, ",")
            "#{k}=#{comma_separated}"

          {k, value} ->
            "#{k}=#{value |> to_string() |> URI.encode()}"
        end)
        |> Enum.join("&")

      uri
      |> URI.parse()
      |> Map.put(:query, query_string)
    end
  end
end
