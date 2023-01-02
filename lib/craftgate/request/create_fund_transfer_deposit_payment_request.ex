defmodule Craftgate.Request.CreateFundTransferDepositPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateFundTransferDepositPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateFundTransferDepositPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    price: :decimal,
    buyer_member_id: :integer,
    conversation_id: :string,
    client_ip: :string
  ]
end
