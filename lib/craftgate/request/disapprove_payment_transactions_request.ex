defmodule Craftgate.Request.DisapprovePaymentTransactionsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.DisapprovePaymentTransactionsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/DisapprovePaymentTransactionsRequest.java)
  """

  use Craftgate.Serializable, [
    payment_transaction_ids: {:array, :integer},
    is_transactional: :boolean
  ]
end
