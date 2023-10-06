defmodule Craftgate.Response.InitPosApmPaymentResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.InitPosApmPaymentResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/InitPosApmPaymentResponse.java)
  """

  use Craftgate.Serializable, [
    html_content: :string,
    payment_id: :integer,
    payment_status: Craftgate.Model.PaymentStatus,
    additional_action: Craftgate.Model.AdditionalAction,
    payment_error: Craftgate.Response.Dto.PaymentError
  ]
end
