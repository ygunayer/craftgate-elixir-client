defmodule Craftgate.Response.RefundWalletTransactionListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.RefundWalletTransactionListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/RefundWalletTransactionListResponse.java)
  """

  use Craftgate.Serializable, [
    items: {:array, Craftgate.Response.RefundWalletTransactionResponse}
  ]
end
