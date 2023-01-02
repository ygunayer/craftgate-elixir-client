defmodule Craftgate.Request.ApprovePaymentTransactionsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.ApprovePaymentTransactionsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/ApprovePaymentTransactionsRequest.java)
  """

  use Craftgate.Serializable, [
    payment_transaction_ids: {:array, :integer},
    is_transactional: :boolean
  ]
end
