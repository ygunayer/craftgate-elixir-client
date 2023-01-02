defmodule Craftgate.Request.Dto.FraudPaymentData do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.FraudPaymentData](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/FraudPaymentData.java)
  """

  use Craftgate.Serializable, [
    payment_date: :naive_datetime,
    conversation_id: :string,
    paid_price: :decimal,
    currency: :string,
    card_fingerprint_id: :string,
    card_fingerprint_expiration_date: :naive_datetime,
    buyer_id: :integer,
    client_ip: :string
  ]
end
