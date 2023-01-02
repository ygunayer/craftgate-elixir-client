defmodule Craftgate.Response.PayoutBouncedTransactionListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PayoutBouncedTransactionListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PayoutBouncedTransactionListResponse.java)
  """

  use Craftgate.Serializable, [
    items: {:array, Craftgate.Response.Dto.PayoutBouncedTransaction}
  ]
end
