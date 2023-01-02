defmodule Craftgate.Model.RemittanceType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.RemittanceType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/RemittanceType.java)
  """

  use Craftgate.Enum, [
    :SEND,
    :RECEIVE
  ]
end
