defmodule Craftgate.Response.CompletePosApmPaymentResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.CompletePosApmPaymentResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/CompletePosApmPaymentResponse.java)
  """

  use Craftgate.Serializable, [
    conversation_id: :string,
    payment_id: :integer,
    payment_status: Craftgate.Model.PaymentStatus,
    payment_error: Craftgate.Response.Dto.PaymentError
  ]
end
