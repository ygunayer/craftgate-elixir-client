defmodule Craftgate.Response.PaymentTransactionRefundResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PaymentTransactionRefundResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PaymentTransactionRefundResponse.java)
  """

  use Craftgate.Serializable, [
    currency: Craftgate.Model.Currency,
    payment_id: :integer,
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
    is_after_settlement: :boolean,
    payment_transaction_id: :integer
  ]
end
