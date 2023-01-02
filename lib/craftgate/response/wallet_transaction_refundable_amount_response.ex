defmodule Craftgate.Response.WalletTransactionRefundableAmountResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.WalletTransactionRefundableAmountResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/WalletTransactionRefundableAmountResponse.java)
  """

  use Craftgate.Serializable, [
    refundable_amount: :decimal
  ]
end
