defmodule Craftgate.Request.RefundPaymentTransactionRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.RefundPaymentTransactionRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/RefundPaymentTransactionRequest.java)
  """

  use Craftgate.Serializable, [
    payment_transaction_id: :integer,
    conversation_id: :string,
    refund_price: :decimal,
    refund_destination_type: Craftgate.Model.RefundDestinationType,
    charge_from_me: :boolean
  ]
end
