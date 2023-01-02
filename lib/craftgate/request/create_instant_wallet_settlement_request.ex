defmodule Craftgate.Request.CreateInstantWalletSettlementRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateInstantWalletSettlementRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateInstantWalletSettlementRequest.java)
  """

  use Craftgate.Serializable, [
    excluded_sub_merchant_member_ids: {:array, :integer}
  ]
end
