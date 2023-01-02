defmodule Craftgate.Model.Status do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.Status](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/Status.java)
  """

  use Craftgate.Enum, [
    :PASSIVE,
    :ACTIVE
  ]
end
