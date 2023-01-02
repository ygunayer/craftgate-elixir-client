defmodule Craftgate.Request.UpdateWalletRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.UpdateWalletRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/UpdateWalletRequest.java)
  """

  use Craftgate.Serializable, [
    negative_amount_limit: :decimal
  ]
end
