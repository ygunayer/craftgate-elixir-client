defmodule Craftgate.Request.SearchWithdrawsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchWithdrawsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchWithdrawsRequest.java)
  """

  use Craftgate.Serializable, [
    member_id: :integer,
    currency: Craftgate.Model.Currency,
    payout_status: Craftgate.Model.TransactionPayoutStatus,
    min_withdraw_price: :decimal,
    max_withdraw_price: :decimal,
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime,
    page: :integer,
    size: :integer
  ]
end
