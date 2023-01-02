defmodule Craftgate.Request.ResetMerchantMemberWalletBalanceRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.ResetMerchantMemberWalletBalanceRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/ResetMerchantMemberWalletBalanceRequest.java)
  """

  use Craftgate.Serializable, [
    wallet_amount: :decimal
  ]
end
