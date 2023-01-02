defmodule Craftgate.Model.WebhookData do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.model.WebhookData](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/WebhookData.java)
  """

  use Craftgate.Serializable, [
    event_type: Craftgate.Model.WebhookEventType,
    event_time: :naive_datetime,
    event_timestamp: :integer,
    status: Craftgate.Model.WebhookStatus,
    payload_id: :string
  ]
end
