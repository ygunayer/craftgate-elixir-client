defmodule Craftgate.Model.ApprovalStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.ApprovalStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/ApprovalStatus.java)
  """

  use Craftgate.Enum, [
    :SUCCESS,
    :FAILURE
  ]
end
