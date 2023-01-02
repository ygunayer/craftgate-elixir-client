defmodule Craftgate.Model.FileStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.FileStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/FileStatus.java)
  """

  use Craftgate.Enum, [
    :CREATED,
    :APPROVED,
    :UPLOADED
  ]
end
