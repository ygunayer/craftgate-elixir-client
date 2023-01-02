defmodule Craftgate.Model.SettlementEarningsDestination do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.SettlementEarningsDestination](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/SettlementEarningsDestination.java)
  """

  use Craftgate.Enum, [
    :IBAN,
    :WALLET
  ]
end
