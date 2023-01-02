defmodule Mix.TaskHelper do
  def set_sample_config() do
    HTTPoison.start()

    case Craftgate.Config.get() do
      {:error, _} ->
        Application.put_env(:craftgate, :api_key, "sandbox-YEhueLgomBjqsnvBlWVVuFsVhlvJlMHE")
        Application.put_env(:craftgate, :secret_key, "sandbox-tBdcdKVGmGupzfaWcULcwDLMoglZZvTz")
        Application.put_env(:craftgate, :base_url, "https://sandbox-api.craftgate.io")
        Application.put_env(:craftgate, :lang, "tr")

      {:ok, _} -> nil
    end
  end
end
