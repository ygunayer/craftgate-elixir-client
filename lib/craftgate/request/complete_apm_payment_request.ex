defmodule Craftgate.Request.CompleteApmPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CompleteApmPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CompleteApmPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    payment_id: :integer,
    additional_params: :map
  ]
end
