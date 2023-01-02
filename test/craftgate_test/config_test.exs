defmodule CraftgateTest.ConfigTest do
  use ExUnit.Case, async: true

  @mock_api_key "mock-api-key"
  @mock_secret_key "mock-secret-key"
  @mock_base_url "http://api.craftgate.mock"
  @mock_lang "tr"
  @mock_request_options [timeout: 5_000, recv_timeout: 4_000]

  @mock_config %Craftgate.Config{
    api_key: @mock_api_key,
    secret_key: @mock_secret_key,
    base_url: @mock_base_url,
    lang: @mock_lang,
    request_options: @mock_request_options
  }

  describe "Craftgate.Config.get/0 without api_key" do
    setup [:clear_all_options]

    test "should return an error tuple" do
      assert match?({:error, _}, Craftgate.Config.get())
    end
  end

  describe "Craftgate.Config.get/0 without secret_key" do
    setup [:clear_all_options, :set_only_api_key]

    test "should return an error tuple" do
      assert match?({:error, _}, Craftgate.Config.get())
    end
  end

  describe "Craftgate.Config.get/0 with all keys" do
    setup [:clear_all_options, :set_all_options]

    test "should return an OK tuple with desired options" do
      assert {:ok, @mock_config} == Craftgate.Config.get()
    end
  end

  defp set_only_api_key(_) do
    Application.put_env(:craftgate_test, :api_key, @mock_api_key)
    on_exit(fn -> clear_all_options() end)
  end

  defp set_all_options(_) do
    Application.put_env(:craftgate_test, :api_key, @mock_api_key)
    Application.put_env(:craftgate_test, :secret_key, @mock_secret_key)
    Application.put_env(:craftgate_test, :base_url, @mock_base_url)
    Application.put_env(:craftgate_test, :lang, @mock_lang)
    Application.put_env(:craftgate_test, :request_options, @mock_request_options)
  end

  defp clear_all_options(), do: clear_all_options(nil)

  defp clear_all_options(_) do
    Application.delete_env(:craftgate_test, :api_key)
    Application.delete_env(:craftgate_test, :secret_key)
    Application.delete_env(:craftgate_test, :base_url)
    Application.delete_env(:craftgate_test, :lang)
    Application.delete_env(:craftgate_test, :request_options)
  end
end
