defmodule CraftgateTest.Adapter.InstallmentAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Model.Currency
  alias Craftgate.Request.SearchInstallmentsRequest
  alias Craftgate.Adapter.InstallmentAdapter

  describe "Craftgate.Adapter.InstallmentAdapter" do
    test_endpoint(
      "search_installments/1",
      when:
        InstallmentAdapter.search_installments(%SearchInstallmentsRequest{
          bin_number: "123456",
          currency: Currency.try(),
          price: Decimal.new("10.0"),
          distinct_card_brands_with_lowest_commissions: false
        }),
      expect: [
        get:
          "/installment/v1/installments?binNumber=123456&currency=TRY&distinctCardBrandsWithLowestCommissions=false&price=10.0"
      ]
    )

    test_endpoint(
      "retrieve_bin_number/1",
      when: InstallmentAdapter.retrieve_bin_number("12345678"),
      expect: [
        get: "/installment/v1/bins/12345678"
      ]
    )
  end
end
