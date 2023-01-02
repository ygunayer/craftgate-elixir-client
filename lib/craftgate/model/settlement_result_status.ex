defmodule Craftgate.Model.SettlementResultStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.SettlementResultStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/SettlementResultStatus.java)
  """

  use Craftgate.Enum, [
    :SUCCESS,
    :NO_RECORD_FOUND,
    :FAILURE
  ]
end
