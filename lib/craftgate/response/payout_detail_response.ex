defmodule Craftgate.Response.PayoutDetailResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PayoutDetailResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PayoutDetailResponse.java)
  """

  use Craftgate.Serializable, [
    row_description: :string,
    payout_date: :naive_datetime,
    name: :string,
    iban: :string,
    payout_amount: :decimal,
    currency: :string,
    merchant_id: :integer,
    merchant_type: :string,
    settlement_earnings_destination: :string,
    settlement_source: :string,
    bounce_status: Craftgate.Model.BounceStatus,
    payout_transactions: {:array, Craftgate.Response.Dto.PayoutDetailTransaction}
  ]
end
