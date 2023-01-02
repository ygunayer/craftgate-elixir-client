defmodule Craftgate.Response.FundTransferDepositPaymentResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.FundTransferDepositPaymentResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/FundTransferDepositPaymentResponse.java)
  """

  use Craftgate.Serializable, [
    price: :decimal,
    currency: :string,
    conversation_id: :string,
    buyer_member_id: :integer,
    wallet_transaction: Craftgate.Response.Dto.WalletTransaction
  ]
end
