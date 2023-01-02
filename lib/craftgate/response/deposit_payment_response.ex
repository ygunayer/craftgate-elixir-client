defmodule Craftgate.Response.DepositPaymentResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.DepositPaymentResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/DepositPaymentResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    price: :decimal,
    currency: :string,
    buyer_member_id: :integer,
    conversation_id: :string,
    bank_commission_rate: :decimal,
    bank_commission_rate_amount: :decimal,
    auth_code: :string,
    host_reference: :string,
    trans_id: :string,
    order_id: :string,
    payment_type: Craftgate.Model.PaymentType,
    created_date: :naive_datetime,
    payment_status: Craftgate.Model.PaymentStatus,
    card_user_key: :string,
    card_token: :string,
    wallet_transaction: Craftgate.Response.Dto.WalletTransaction,
    fraud_id: :integer,
    fraud_action: Craftgate.Model.FraudAction
  ]
end
