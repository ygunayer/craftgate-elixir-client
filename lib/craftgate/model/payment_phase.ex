defmodule Craftgate.Model.PaymentPhase do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentPhase](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentPhase.java)
  """

  use Craftgate.Enum, [
    :PRE_AUTH,
    :POST_AUTH,
    :AUTH
  ]
end
