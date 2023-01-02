defmodule Craftgate.Request.SearchInstallmentsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchInstallmentsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchInstallmentsRequest.java)
  """

  use Craftgate.Serializable, [
    bin_number: :string,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    distinct_card_brands_with_lowest_commissions: :boolean
  ]
end
