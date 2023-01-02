defmodule CraftgateTest.Adapter.PayByLinkAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Adapter.PayByLinkAdapter
  alias Craftgate.Model.Currency
  alias Craftgate.Request.CreateProductRequest
  alias Craftgate.Request.UpdateProductRequest
  alias Craftgate.Request.SearchProductsRequest

  describe "Craftgate.Adapter.PayByLinkAdapter" do
    test_endpoint(
      "create_product/1",
      when:
        PayByLinkAdapter.create_product(%CreateProductRequest{
          name: "Mechanical Keyboard",
          description: "Best mechanical keyboard in the universe",
          external_id: "mech-keyboard-1",
          channel: "web",
          currency: Currency.usd(),
          price: Decimal.new("100.0"),
          enabled_installments: [1]
        }),
      expect: [
        post: "/craftlink/v1/products",
        body: @fixture_request_create_product
      ]
    )

    test_endpoint(
      "update_product/2",
      when:
        PayByLinkAdapter.update_product(
          42,
          %UpdateProductRequest{
            price: Decimal.new("101.0")
          }
        ),
      expect: [
        put: "/craftlink/v1/products/42",
        body: @fixture_request_update_product
      ]
    )

    test_endpoint(
      "retrieve_product/1",
      when: PayByLinkAdapter.retrieve_product(42),
      expect: [
        get: "/craftlink/v1/products/42"
      ]
    )

    test_endpoint(
      "delete_product/1",
      when: PayByLinkAdapter.delete_product(42),
      expect: [
        delete: "/craftlink/v1/products/42"
      ]
    )

    test_endpoint(
      "search_products/1",
      when:
        PayByLinkAdapter.search_products(%SearchProductsRequest{
          min_price: Decimal.new("99.9"),
          max_price: Decimal.new("101.0")
        }),
      expect: [
        get: "/craftlink/v1/products?maxPrice=101.0&minPrice=99.9"
      ]
    )
  end
end
