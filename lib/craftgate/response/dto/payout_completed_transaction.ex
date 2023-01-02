defmodule Craftgate.Response.Dto.PayoutCompletedTransaction do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PayoutCompletedTransaction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PayoutCompletedTransaction.java)
  """

  use Craftgate.Serializable, [
    payout_id: :integer,
    transaction_id: :integer,
    transaction_type: :string,
    payout_amount: :decimal,
    currency: :string,
    merchant_id: :integer,
    merchant_type: Craftgate.Model.MerchantType,
    settlement_earnings_destination: Craftgate.Model.SettlementEarningsDestination,
    settlement_source: Craftgate.Model.SettlementSource
  ]
end
