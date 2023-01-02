defmodule Craftgate.Response.WalletResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.WalletResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/WalletResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    created_date: :naive_datetime,
    updated_date: :naive_datetime,
    amount: :decimal,
    withdrawal_amount: :decimal,
    negative_amount_limit: :decimal,
    currency: Craftgate.Model.Currency,
    member_id: :integer
  ]
end
