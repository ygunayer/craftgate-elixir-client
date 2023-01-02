defmodule Craftgate.Request.InitGarantiPayPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.InitGarantiPayPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/InitGarantiPayPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    price: :decimal,
    paid_price: :decimal,
    currency: Craftgate.Model.Currency,
    pos_alias: :string,
    payment_group: Craftgate.Model.PaymentGroup,
    conversation_id: :string,
    external_id: :string,
    callback_url: :string,
    client_ip: :string,
    payment_channel: :string,
    buyer_member_id: :integer,
    bank_order_id: :string,
    items: {:array, Craftgate.Request.Dto.PaymentItem},
    installments: {:array, Craftgate.Request.Dto.GarantiPayInstallment}
  ]
end
