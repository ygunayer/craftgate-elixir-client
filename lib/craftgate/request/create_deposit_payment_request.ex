defmodule Craftgate.Request.CreateDepositPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateDepositPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateDepositPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    buyer_member_id: :integer,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    conversation_id: :string,
    callback_url: :string,
    pos_alias: :string,
    client_ip: :string,
    card: Craftgate.Request.Dto.Card
  ]
end
