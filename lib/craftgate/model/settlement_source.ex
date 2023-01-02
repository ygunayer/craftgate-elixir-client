defmodule Craftgate.Model.SettlementSource do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.SettlementSource](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/SettlementSource.java)
  """

  use Craftgate.Enum, [
    :WITHDRAW,
    :BOUNCED,
    :COLLECTION
  ]
end
