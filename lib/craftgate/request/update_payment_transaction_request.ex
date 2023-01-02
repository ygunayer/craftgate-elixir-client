defmodule Craftgate.Request.UpdatePaymentTransactionRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.UpdatePaymentTransactionRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/UpdatePaymentTransactionRequest.java)
  """

  use Craftgate.Serializable, [
    payment_transaction_id: :integer,
    sub_merchant_member_id: :integer,
    sub_merchant_member_price: :decimal
  ]
end
