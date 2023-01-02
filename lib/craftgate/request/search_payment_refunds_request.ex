defmodule Craftgate.Request.SearchPaymentRefundsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPaymentRefundsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPaymentRefundsRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    id: :integer,
    payment_id: :integer,
    buyer_member_id: :integer,
    conversation_id: :string,
    status: Craftgate.Model.RefundStatus,
    currency: Craftgate.Model.Currency,
    min_refund_price: :decimal,
    max_refund_price: :decimal,
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime
  ]
end
