defmodule Craftgate.Model.RefundDestinationType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.RefundDestinationType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/RefundDestinationType.java)
  """

  use Craftgate.Enum, [
    :WALLET,
    :PROVIDER,
    :CARD
  ]
end
