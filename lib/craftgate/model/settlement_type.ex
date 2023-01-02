defmodule Craftgate.Model.SettlementType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.SettlementType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/SettlementType.java)
  """

  use Craftgate.Enum, [
    :BOUNCED_SETTLEMENT,
    :WITHDRAW,
    :SETTLEMENT
  ]
end
