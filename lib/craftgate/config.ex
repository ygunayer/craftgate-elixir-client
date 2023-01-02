defmodule Craftgate.Config do
  @moduledoc """
  Represents a set of configuration options for Craftgate
  """

  @enforce_keys [:api_key, :secret_key, :base_url, :lang, :request_options]
  defstruct [:api_key, :secret_key, :base_url, :lang, :request_options]

  @mix_env Mix.env()

  @type t :: %__MODULE__{
    api_key: api_key(),
    secret_key: secret_key(),
    base_url: base_url(),
    lang: lang(),
    request_options: request_options()
  }

  @type api_key :: binary()
  @type secret_key :: binary()
  @type base_url :: binary()
  @type lang :: binary()
  @type request_options :: keyword()

  @spec get!() :: Craftgate.Config.t()
  def get!() do
    options = config_key() |> Application.get_all_env()

    base_url = Keyword.get(options, :base_url, "https://sandbox-api.craftgate.io")
    api_key = Keyword.get(options, :api_key)
    secret_key = Keyword.get(options, :secret_key)
    lang = Keyword.get(options, :lang, "en")

    request_options =
      Keyword.get(options, :request_options,
        timeout: 10_000,
        recv_timeout: 150_000,
        max_redirect: 0,
        follow_redirect: false
      )

    if [api_key, secret_key] |> Enum.any?(&Craftgate.Utils.is_empty?/1) do
      raise "Please make sure to specify the Craftgate API key and secret"
    end

    %__MODULE__{
      api_key: api_key,
      secret_key: secret_key,
      base_url: base_url,
      lang: lang,
      request_options: request_options
    }
  end

  @spec get() :: {:ok, Craftgate.Config.t()} | {:error, any()}
  def get() do
    try do
      config = get!()
      {:ok, config}
    rescue
      error -> {:error, error}
    end
  end

  defp config_key(), do: if @mix_env == :test, do: :craftgate_test, else: :craftgate
end
