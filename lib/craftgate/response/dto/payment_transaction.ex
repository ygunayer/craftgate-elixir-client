defmodule Craftgate.Response.Dto.PaymentTransaction do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PaymentTransaction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PaymentTransaction.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    name: :string,
    external_id: :string,
    price: :decimal,
    paid_price: :decimal,
    wallet_price: :decimal,
    merchant_commission_rate: :decimal,
    merchant_commission_rate_amount: :decimal,
    merchant_payout_amount: :decimal,
    sub_merchant_member_id: :integer,
    sub_merchant_member_price: :decimal,
    sub_merchant_member_payout_rate: :decimal,
    sub_merchant_member_payout_amount: :decimal,
    transaction_status: Craftgate.Model.TransactionStatus,
    blockage_resolved_date: :naive_datetime,
    payout: Craftgate.Response.Dto.Payout
  ]
end
