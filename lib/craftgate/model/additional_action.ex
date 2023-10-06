defmodule Craftgate.Model.AdditionalAction do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.AdditionalAction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/AdditionalAction.java)
  """

  use Craftgate.Enum, [
    :CONTINUE_IN_CLIENT,
    :NONE,
    :SHOW_HTML_CONTENT
  ]
end
