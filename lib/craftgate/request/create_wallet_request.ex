defmodule Craftgate.Request.CreateWalletRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateWalletRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateWalletRequest.java)
  """

  use Craftgate.Serializable, [
    negative_amount_limit: :decimal,
    currency: Craftgate.Model.Currency
  ]
end
