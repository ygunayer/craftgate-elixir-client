defmodule Craftgate.Request.InitThreeDSPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.InitThreeDSPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/InitThreeDSPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    callback_url: :string,
    price: :decimal,
    paid_price: :decimal,
    wallet_price: :decimal,
    pos_alias: :string,
    installment: :integer,
    currency: Craftgate.Model.Currency,
    payment_group: Craftgate.Model.PaymentGroup,
    conversation_id: :string,
    external_id: :string,
    client_ip: :string,
    payment_phase: Craftgate.Model.PaymentPhase,
    payment_channel: :string,
    buyer_member_id: :integer,
    bank_order_id: :string,
    card: Craftgate.Request.Dto.Card,
    fraud_params: Craftgate.Request.Dto.FraudCheckParameters,
    items: {:array, Craftgate.Request.Dto.PaymentItem},
    additional_params: :map,
    retry: :boolean
  ]
end
