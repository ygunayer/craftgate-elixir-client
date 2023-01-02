defmodule Craftgate.Request.InitApmDepositPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.InitApmDepositPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/InitApmDepositPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    apm_type: Craftgate.Model.ApmType,
    merchant_apm_id: :integer,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    buyer_member_id: :integer,
    payment_channel: :string,
    conversation_id: :string,
    external_id: :string,
    callback_url: :string,
    apm_order_id: :string,
    apm_user_identity: :string,
    additional_params: :map,
    client_ip: :string
  ]
end
