defmodule Craftgate.Response.Dto.ReportingPaymentTransaction do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.ReportingPaymentTransaction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/ReportingPaymentTransaction.java)
  """

  use Craftgate.Serializable, [
    created_date: :naive_datetime,
    transaction_status_date: :naive_datetime,
    refundable_price: :decimal,
    sub_merchant_member: Craftgate.Response.MemberResponse,
    refund_status: Craftgate.Model.PaymentRefundStatus,
    payout_status: Craftgate.Response.Dto.PayoutStatus,
    bank_commission_rate: :decimal,
    bank_commission_rate_amount: :decimal,
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
