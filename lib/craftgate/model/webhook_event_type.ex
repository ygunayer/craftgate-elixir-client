defmodule Craftgate.Model.WebhookEventType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.WebhookEventType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/WebhookEventType.java)
  """

  use Craftgate.Enum, [
    :THREEDS_VERIFY,
    :CHECKOUTFORM_AUTH,
    :API_VERIFY_AND_AUTH,
    :API_AUTH
  ]
end
