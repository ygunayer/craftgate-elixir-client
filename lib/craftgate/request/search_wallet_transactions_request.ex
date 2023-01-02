defmodule Craftgate.Request.SearchWalletTransactionsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchWalletTransactionsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchWalletTransactionsRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    wallet_transaction_types: {:array, Craftgate.Model.WalletTransactionType},
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime,
    min_amount: :decimal,
    max_amount: :decimal
  ]
end
