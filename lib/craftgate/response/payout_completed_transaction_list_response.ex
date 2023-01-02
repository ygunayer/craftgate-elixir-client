defmodule Craftgate.Response.PayoutCompletedTransactionListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PayoutCompletedTransactionListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PayoutCompletedTransactionListResponse.java)
  """

  use Craftgate.Serializable, [
    items: {:array, Craftgate.Response.Dto.PayoutCompletedTransaction}
  ]
end
