defmodule CraftgateTest.SerializableTest do
  use ExUnit.Case, async: true

  doctest Craftgate

  alias Craftgate.Request.CreatePaymentRequest
  alias Craftgate.Request.Dto.PaymentItem
  alias Craftgate.Request.Dto.Card
  alias Craftgate.Model.Currency

  alias CraftgateTest.Support.Modules.FooResponse
  alias CraftgateTest.Support.Modules.BarResponse
  alias CraftgateTest.Support.Modules.BazResponse
  alias CraftgateTest.Support.Modules.CustomStruct

  @fixtures_root "test/fixtures/serializable"

  @fixture_request_create_payment1 File.read!("#{@fixtures_root}/request_create_payment1.json")
  @fixture_response_error_10051 File.read!("#{@fixtures_root}/response_error_10051.json")
  @fixture_response_error_9001 File.read!("#{@fixtures_root}/response_error_9001.json")
  @fixture_response_error_raw_404 File.read!("#{@fixtures_root}/response_error_raw_404.html")
  @fixture_response_ok_raw File.read!("#{@fixtures_root}/response_ok_raw.html")
  @fixture_response_ok_foo1 File.read!("#{@fixtures_root}/response_ok_foo1.json")

  @error_10051 %Craftgate.Error{
    code: "10051",
    description: "Kart limiti yetersiz, yetersiz bakiye",
    group: :NOT_SUFFICIENT_FUNDS
  }

  @error_9001 %Craftgate.Error{
    code: "9001",
    description: "Payment not found!"
  }

  @some_error_tuple {:error, :some_error}

  @foo_response1 %FooResponse{
    id: 1,
    name: "Foo 1",
    bar: %BarResponse{
      id: 10,
      baz: [
        %BazResponse{id: 100},
        %BazResponse{id: 101}
      ]
    }
  }

  @map_foo_response1 %{
    "id" => 1,
    "name" => "Foo 1",
    "bar" => %{
      "id" => 10,
      "baz" => [
        %{"id" => 100},
        %{"id" => 101}
      ]
    }
  }

  @request_create_payment1 %CreatePaymentRequest{
    price: Decimal.new("100.0"),
    paid_price: Decimal.new("100.0"),
    wallet_price: Decimal.new("0.0"),
    currency: Currency.try(),
    installment: 1,
    items: [
      %PaymentItem{price: Decimal.new("100.0"), name: "test item #1"}
    ],
    card: %Card{
      card_number: "5406670000000009",
      card_holder_name: "Foo Bar",
      cvc: "000",
      expire_month: "12",
      expire_year: "2024"
    }
  }

  @response_error_10051 %HTTPoison.Response{
    body: @fixture_response_error_10051,
    status_code: 422
  }

  @response_error_9001 %HTTPoison.Response{
    body: @fixture_response_error_9001,
    status_code: 404
  }

  @response_error_raw_404 %HTTPoison.Response{
    body: @fixture_response_error_raw_404,
    status_code: 404
  }

  @response_ok_but_error_10051 %HTTPoison.Response{
    body: @fixture_response_error_10051,
    status_code: 200
  }

  @response_ok_raw %HTTPoison.Response{
    body: @fixture_response_ok_raw,
    status_code: 200
  }

  @response_ok_foo1 %HTTPoison.Response{
    body: @fixture_response_ok_foo1,
    status_code: 200
  }

  describe "Craftgate.Serializable.serialize/1" do
    test "should serialize correctly" do
      {:ok, serialized} = Craftgate.Serializable.serialize(@request_create_payment1)
      assert Jason.decode!(serialized) == Jason.decode!(@fixture_request_create_payment1)
    end

    test "should not re-serialize string" do
      assert {:ok, "foo"} == Craftgate.Serializable.serialize("foo")
    end

    test "should convert snake_case fields of structs to camelCase and exclude null fields" do
      assert {:ok, "{\"fooBar\":42}"} ==
               Craftgate.Serializable.serialize(%CustomStruct{foo_bar: 42})
    end

    test "should convert snake_case fields of maps to camelCase and exclude null fields" do
      assert {:ok, "{\"fooBar\":42}"} ==
               Craftgate.Serializable.serialize(%{foo_bar: 42, baz: nil})
    end
  end

  describe "Craftgate.Serializable.serialize!/1" do
    test "should return when serialization succeeds" do
      serialized = Craftgate.Serializable.serialize!(@request_create_payment1)
      assert Jason.decode!(serialized) == Jason.decode!(@fixture_request_create_payment1)
    end
  end

  describe "Craftgate.Serializable.parse/2" do
    test "should parse error tuple as an error instance" do
      assert @some_error_tuple == Craftgate.Serializable.parse(@some_error_tuple, :void)
    end

    test "should parse non-2xx HTTPoison response with error body as an error tuple" do
      assert {:error, @error_10051} == Craftgate.Serializable.parse(@response_error_10051, :void)
    end

    test "should parse 2xx HTTPoison response with error body as an error tuple" do
      assert {:error, @error_10051} ==
               Craftgate.Serializable.parse(@response_ok_but_error_10051, :map)
    end

    test "should parse non-2xx HTTPoison response within OK tuple as a CraftgateError" do
      assert {:error, @error_10051} ==
               Craftgate.Serializable.parse({:ok, @response_error_10051}, :void)
    end

    test "should parse non-2xx HTTPoison response with error body without errorGroup as an error tuple" do
      assert {:error, @error_9001} == Craftgate.Serializable.parse(@response_error_9001, :void)
    end

    test "should parse non-2xx HTTPoison response within OK tuple without errorGroup as a CraftgateError" do
      assert {:error, @error_9001} ==
               Craftgate.Serializable.parse({:ok, @response_error_9001}, :void)
    end

    test "should parse non-2xx HTTPoison response with HTML response as an error tuple with `Jason.DecodeError`" do
      assert match?(
               {:error, %Jason.DecodeError{}},
               Craftgate.Serializable.parse(@response_error_raw_404, :void)
             )
    end

    test "should parse 2xx HTTPoison response as `{:ok, nil}` when `as` is `:void`" do
      assert match?(
               {:ok, nil},
               Craftgate.Serializable.parse(@response_ok_foo1, :void)
             )
    end

    test "should parse 2xx HTTPoison response as `{:ok, String}` when `as` is `String`" do
      assert {:ok, @fixture_response_ok_foo1} ==
               Craftgate.Serializable.parse(@response_ok_foo1, String)
    end

    test "should parse 2xx HTTPoison response with HTML body as `{:ok, String}` when `as` is `String`" do
      assert {:ok, @fixture_response_ok_raw} ==
               Craftgate.Serializable.parse(@response_ok_raw, String)
    end

    test "should parse 2xx HTTPoison response with HTML response as an error tuple with `Jason.DecodeError` when `as` is `FooResponse`" do
      assert match?(
               {:error, %Jason.DecodeError{}},
               Craftgate.Serializable.parse(@response_ok_raw, FooResponse)
             )
    end

    test "should parse 2xx HTTPoison response as `{:ok, FooResponse}` when `as` is `FooResponse`" do
      assert {:ok, @foo_response1} == Craftgate.Serializable.parse(@response_ok_foo1, FooResponse)
    end

    test "should parse map as `{:ok, FooResponse}` when `as` is `FooResponse`" do
      assert {:ok, @foo_response1} ==
               Craftgate.Serializable.parse(@map_foo_response1, FooResponse)
    end

    test "should parse 2xx HTTPoison response as `{:ok, FooResponse}` when `as` is `:map`" do
      assert {:ok, @map_foo_response1} == Craftgate.Serializable.parse(@response_ok_foo1, :map)
    end

    test "should parse map as OK tuple with map when `as` is `:map`" do
      assert {:ok, @map_foo_response1} == Craftgate.Serializable.parse(@map_foo_response1, :map)
    end
  end

  describe "Craftgate.Serializable.parse!/2" do
    test "should return if parse succeeds" do
      assert @foo_response1 == Craftgate.Serializable.parse!(@response_ok_foo1, FooResponse)
    end

    test "should raise if parse returns an error" do
      assert_raise Craftgate.Error, fn ->
        Craftgate.Serializable.parse!(@response_error_9001, FooResponse)
      end
    end
  end
end
