defmodule Craftgate.Request.SearchPaymentsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPaymentsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPaymentsRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    payment_id: :integer,
    payment_transaction_id: :integer,
    buyer_member_id: :integer,
    sub_merchant_member_id: :integer,
    conversation_id: :string,
    external_id: :string,
    order_id: :string,
    payment_type: Craftgate.Model.PaymentType,
    payment_provider: Craftgate.Model.PaymentProvider,
    payment_status: Craftgate.Model.PaymentStatus,
    payment_source: Craftgate.Model.PaymentSource,
    payment_channel: :string,
    bin_number: :string,
    last_four_digits: :string,
    currency: Craftgate.Model.Currency,
    min_paid_price: :decimal,
    max_paid_price: :decimal,
    installment: :integer,
    is_three_ds: :boolean,
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime
  ]
end
