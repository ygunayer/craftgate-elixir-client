defmodule Craftgate.Request.CreateApmPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateApmPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateApmPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    apm_type: Craftgate.Model.ApmType,
    price: :decimal,
    paid_price: :decimal,
    currency: Craftgate.Model.Currency,
    payment_group: Craftgate.Model.PaymentGroup,
    payment_channel: :string,
    conversation_id: :string,
    external_id: :string,
    buyer_member_id: :integer,
    apm_order_id: :string,
    client_ip: :string,
    items: {:array, Craftgate.Request.Dto.PaymentItem}
  ]
end
