defmodule Craftgate.Request.CompleteThreeDSPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CompleteThreeDSPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CompleteThreeDSPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    payment_id: :integer
  ]
end
