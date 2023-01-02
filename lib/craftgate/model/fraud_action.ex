defmodule Craftgate.Model.FraudAction do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.FraudAction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/FraudAction.java)
  """

  use Craftgate.Enum, [
    :BLOCK,
    :REVIEW
  ]
end
