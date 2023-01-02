defmodule Craftgate.Response.WalletTransactionResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.WalletTransactionResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/WalletTransactionResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    created_date: :naive_datetime,
    wallet_transaction_type: Craftgate.Model.WalletTransactionType,
    amount: :decimal,
    transaction_id: :integer,
    wallet_id: :integer
  ]
end
