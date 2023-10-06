defmodule Craftgate.Request.InitCheckoutPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.InitCheckoutPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/InitCheckoutPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    price: :decimal,
    paid_price: :decimal,
    currency: Craftgate.Model.Currency,
    payment_group: Craftgate.Model.PaymentGroup,
    conversation_id: :string,
    external_id: :string,
    bank_order_id: :string,
    callback_url: :string,
    client_ip: :string,
    payment_phase: Craftgate.Model.PaymentPhase,
    payment_channel: :string,
    enabled_payment_methods: {:array, Craftgate.Model.PaymentMethod},
    masterpass_gsm_number: :string,
    masterpass_user_id: :string,
    card_user_key: :string,
    buyer_member_id: :integer,
    enabled_installments: {:array, :integer},
    always_store_card_after_payment: :boolean,
    allow_only_stored_cards: :boolean,
    allow_only_credit_card: :boolean,
    allow_installment_only_commercial_cards: :boolean,
    force_three_ds: :boolean,
    force_auth_for_non_credit_cards: :boolean,
    custom_installments: {:array, Craftgate.Request.Dto.CustomInstallment},
    items: {:array, Craftgate.Request.Dto.PaymentItem}
  ]
end
