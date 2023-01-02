defmodule Craftgate.Response.WithdrawResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.WithdrawResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/WithdrawResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    created_date: :naive_datetime,
    status: Craftgate.Model.Status,
    price: :decimal,
    description: :string,
    currency: Craftgate.Model.Currency,
    payout_status: Craftgate.Model.TransactionPayoutStatus,
    member_id: :integer,
    payout_id: :integer
  ]
end
