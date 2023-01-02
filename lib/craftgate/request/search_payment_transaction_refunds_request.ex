defmodule Craftgate.Request.SearchPaymentTransactionRefundsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPaymentTransactionRefundsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPaymentTransactionRefundsRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    id: :integer,
    payment_id: :integer,
    payment_transaction_id: :integer,
    buyer_member_id: :integer,
    conversation_id: :string,
    status: Craftgate.Model.RefundStatus,
    currency: Craftgate.Model.Currency,
    min_refund_price: :decimal,
    max_refund_price: :decimal,
    is_after_settlement: :boolean,
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime
  ]
end
