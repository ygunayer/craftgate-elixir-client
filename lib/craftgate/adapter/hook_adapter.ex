defmodule Craftgate.Adapter.HookAdapter do
  alias Craftgate.Model.WebhookData
  @doc """
  Provides hook-related utility functions like verifying incoming webhooks
  """

  @spec is_webhook_verified(binary() | nil, binary() | nil, WebhookData.t() | nil) :: boolean()
  def is_webhook_verified(merchant_hook_key, incoming_signature, webhook_data)
    when is_nil(merchant_hook_key) or is_nil(incoming_signature) or is_nil(webhook_data), do: false

  def is_webhook_verified(merchant_hook_key, incoming_signature, %WebhookData{} = webhook_data) do
    data =
      [
        webhook_data.event_type,
        webhook_data.event_timestamp,
        webhook_data.status,
        webhook_data.payload_id
      ]
      |> Enum.map(&to_string/1)
      |> Enum.join("")

    incoming_signature == generate_hash(merchant_hook_key, data)
  end

  defp generate_hash(merchant_hook_key, data), do: :crypto.mac(:hmac, :sha256, merchant_hook_key, data) |> Base.encode16()
end
