defmodule Craftgate.Response.ApmPaymentInitResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ApmPaymentInitResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ApmPaymentInitResponse.java)
  """

  use Craftgate.Serializable, [
    payment_id: :integer,
    redirect_url: :string,
    payment_status: Craftgate.Model.PaymentStatus,
    additional_action: Craftgate.Model.ApmAdditionalAction,
    payment_error: Craftgate.Response.Dto.PaymentError
  ]
end
