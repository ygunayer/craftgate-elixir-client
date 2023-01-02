defmodule Craftgate.Response.WalletTransactionListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.WalletTransactionListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/WalletTransactionListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.WalletTransactionResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
