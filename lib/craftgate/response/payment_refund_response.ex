defmodule Craftgate.Response.PaymentRefundResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PaymentRefundResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PaymentRefundResponse.java)
  """

  use Craftgate.Serializable, [
    refund_type: Craftgate.Model.RefundType,
    currency: Craftgate.Model.Currency,
    payment_transaction_refunds: {:array, Craftgate.Response.PaymentTransactionRefundResponse},
    id: :integer,
    created_date: :naive_datetime,
    status: Craftgate.Model.RefundStatus,
    refund_destination_type: Craftgate.Model.RefundDestinationType,
    refund_price: :decimal,
    refund_bank_price: :decimal,
    refund_wallet_price: :decimal,
    conversation_id: :string,
    auth_code: :string,
    host_reference: :string,
    trans_id: :string,
    payment_id: :integer
  ]
end
