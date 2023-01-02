defmodule Craftgate.Response.Dto.PayoutStatus do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PayoutStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PayoutStatus.java)
  """

  use Craftgate.Serializable, [
    merchant_status: Craftgate.Model.TransactionPayoutStatus,
    merchant_status_date: :naive_datetime,
    sub_merchant_member_status: Craftgate.Model.TransactionPayoutStatus,
    sub_merchant_member_status_date: :naive_datetime
  ]
end
