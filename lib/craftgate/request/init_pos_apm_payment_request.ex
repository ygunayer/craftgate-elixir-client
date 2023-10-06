defmodule Craftgate.Request.InitPosApmPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.InitPosApmPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/InitPosApmPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    price: :decimal,
    paid_price: :decimal,
    pos_alias: :string,
    currency: Craftgate.Model.Currency,
    conversation_id: :string,
    external_id: :string,
    callback_url: :string,
    payment_group: Craftgate.Model.PaymentGroup,
    payment_phase: Craftgate.Model.PaymentPhase,
    payment_channel: :string,
    buyer_member_id: :integer,
    bank_order_id: :string,
    client_ip: :string,
    items: {:array, Craftgate.Request.Dto.PaymentItem},
    additional_params: :map,
    installments: {:array, Craftgate.Request.Dto.PosApmInstallment},
    payment_provider: Craftgate.Model.PosApmPaymentProvider,
    fraud_params: Craftgate.Request.Dto.FraudCheckParameters,
    checkout_form_token: :string
  ]
end
