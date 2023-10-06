defmodule Craftgate.Request.CompletePosApmPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CompletePosApmPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CompletePosApmPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    payment_id: :integer,
    additional_params: :map
  ]
end
