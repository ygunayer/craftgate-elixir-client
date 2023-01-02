defmodule Craftgate.Request.RefundWalletTransactionToCardRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.RefundWalletTransactionToCardRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/RefundWalletTransactionToCardRequest.java)
  """

  use Craftgate.Serializable, [
    refund_price: :decimal
  ]
end
