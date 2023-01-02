defmodule Craftgate.Model.RefundType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.RefundType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/RefundType.java)
  """

  use Craftgate.Enum, [
    :REFUND,
    :CANCEL
  ]
end
