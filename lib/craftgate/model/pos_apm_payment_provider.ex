defmodule Craftgate.Model.PosApmPaymentProvider do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PosApmPaymentProvider](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PosApmPaymentProvider.java)
  """

  use Craftgate.Enum, [
    :YKB_WORLD_PAY,
    :GOOGLEPAY,
    :APPLEPAY
  ]
end
