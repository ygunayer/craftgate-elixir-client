defmodule Craftgate.Model.WebhookStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.WebhookStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/WebhookStatus.java)
  """

  use Craftgate.Enum, [
    :SUCCESS,
    :FAILURE
  ]
end
