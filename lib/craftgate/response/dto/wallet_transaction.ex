defmodule Craftgate.Response.Dto.WalletTransaction do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.WalletTransaction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/WalletTransaction.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    wallet_transaction_type: Craftgate.Model.WalletTransactionType,
    amount: :decimal,
    wallet_id: :integer
  ]
end
