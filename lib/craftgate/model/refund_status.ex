defmodule Craftgate.Model.RefundStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.RefundStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/RefundStatus.java)
  """

  use Craftgate.Enum, [
    :SUCCESS,
    :FAILURE
  ]
end
