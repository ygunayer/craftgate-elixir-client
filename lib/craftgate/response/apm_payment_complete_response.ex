defmodule Craftgate.Response.ApmPaymentCompleteResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ApmPaymentCompleteResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ApmPaymentCompleteResponse.java)
  """

  use Craftgate.Serializable, [
    payment_id: :integer,
    payment_status: Craftgate.Model.PaymentStatus,
    payment_error: Craftgate.Response.Dto.PaymentError
  ]
end
