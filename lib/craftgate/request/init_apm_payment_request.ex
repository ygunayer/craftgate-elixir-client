defmodule Craftgate.Request.InitApmPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.InitApmPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/InitApmPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    apm_type: Craftgate.Model.ApmType,
    merchant_apm_id: :integer,
    price: :decimal,
    paid_price: :decimal,
    buyer_member_id: :integer,
    currency: Craftgate.Model.Currency,
    payment_group: Craftgate.Model.PaymentGroup,
    payment_channel: :string,
    conversation_id: :string,
    external_id: :string,
    callback_url: :string,
    apm_order_id: :string,
    apm_user_identity: :string,
    additional_params: :map,
    client_ip: :string,
    items: {:array, Craftgate.Request.Dto.PaymentItem}
  ]
end
