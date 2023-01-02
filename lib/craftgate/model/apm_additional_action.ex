defmodule Craftgate.Model.ApmAdditionalAction do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.ApmAdditionalAction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/ApmAdditionalAction.java)
  """

  use Craftgate.Enum, [
    :REDIRECT_TO_URL,
    :NONE,
    :OTP_REQUIRED
  ]
end
