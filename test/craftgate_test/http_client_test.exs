defmodule CraftgateTest.HttpClientTest do
  use ExUnit.Case, async: true

  import Mox

  alias Craftgate.HttpClient

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

  setup :verify_on_exit!

  describe "execute" do
    test "should fail if no method is specified" do
      assert {:error, "Request method and URL must both be defined"} ==
               HttpClient.execute([url: "/foo"], @mock_config)
    end

    test "should fail if no URL is specified" do
      assert {:error, "Request method and URL must both be defined"} ==
               HttpClient.execute([method: :get], @mock_config)
    end

    test "should make a GET call to /foo without any properties" do
      opts = [
        method: :get,
        url: "/foo"
      ]

      MockHTTPoison
      |> expect(:request, fn method, url, body, headers, request_options ->
        assert :get == method
        assert "#{@mock_base_url}/foo" == url
        assert "" == body
        assert headers[:"x-api-key"] != nil
        assert headers[:"x-rnd-key"] != nil
        assert headers[:"x-signature"] != nil
        assert headers[:"x-auth-version"] != nil
        assert headers[:"x-client-version"] != nil
        assert headers[:lang] != nil
        assert headers[:"content-type"] != nil
        assert @mock_request_options == request_options
      end)

      assert HttpClient.execute(opts, @mock_config)
    end

    test "should make a GET call to /foo?bar=42 when query params are specified" do
      opts = [
        method: :get,
        url: "/foo",
        params: [bar: 42]
      ]

      MockHTTPoison
      |> expect(:request, fn method, url, body, headers, request_options ->
        assert :get == method
        assert "#{@mock_base_url}/foo?bar=42" == url
        assert "" == body
        assert headers[:"x-api-key"] != nil
        assert headers[:"x-rnd-key"] != nil
        assert headers[:"x-signature"] != nil
        assert headers[:"x-auth-version"] != nil
        assert headers[:"x-client-version"] != nil
        assert headers[:lang] != nil
        assert headers[:"content-type"] != nil
        assert @mock_request_options == request_options
      end)

      assert HttpClient.execute(opts, @mock_config)
    end

    test "should make a POST call to /foo with serialized body" do
      opts = [
        method: :post,
        url: "/foo",
        body: %{foo_bar: 42}
      ]

      MockHTTPoison
      |> expect(:request, fn method, url, body, headers, request_options ->
        assert :post == method
        assert "#{@mock_base_url}/foo" == url
        assert "{\"fooBar\":42}" == body
        assert headers[:"x-api-key"] != nil
        assert headers[:"x-rnd-key"] != nil
        assert headers[:"x-signature"] != nil
        assert headers[:"x-auth-version"] != nil
        assert headers[:"x-client-version"] != nil
        assert headers[:lang] != nil
        assert headers[:"content-type"] != nil
        assert @mock_request_options == request_options
      end)

      assert HttpClient.execute(opts, @mock_config)
    end

    test "should make a PUT call to /foo with all specified options body" do
      opts = [
        method: :put,
        url: "/foo",
        body: %{foo_bar: 42},
        params: [bar: 42],
        headers: [x_baz: "quux"],
        lang: "tr",
        request_options: [timeout: 4242]
      ]

      MockHTTPoison
      |> expect(:request, fn method, url, body, headers, request_options ->
        assert :put == method
        assert "#{@mock_base_url}/foo?bar=42" == url
        assert "{\"fooBar\":42}" == body
        assert "quux" == headers[:x_baz]
        assert "tr" == headers[:lang]
        assert 4242 == request_options[:timeout]

        assert Keyword.delete(@mock_request_options, :timeout) ==
                 Keyword.delete(request_options, :timeout)

        assert headers[:"x-api-key"] != nil
        assert headers[:"x-rnd-key"] != nil
        assert headers[:"x-signature"] != nil
        assert headers[:"x-auth-version"] != nil
        assert headers[:"x-client-version"] != nil
        assert headers[:lang] != nil
        assert headers[:"content-type"] != nil
      end)

      assert HttpClient.execute(opts, @mock_config)
    end
  end
end
