defmodule Craftgate.Model.FraudCheckStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.FraudCheckStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/FraudCheckStatus.java)
  """

  use Craftgate.Enum, [
    :FRAUD,
    :NOT_FRAUD,
    :WAITING
  ]
end
