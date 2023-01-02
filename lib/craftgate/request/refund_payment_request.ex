defmodule Craftgate.Request.RefundPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.RefundPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/RefundPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    payment_id: :integer,
    conversation_id: :string,
    refund_destination_type: Craftgate.Model.RefundDestinationType,
    charge_from_me: :boolean
  ]
end
