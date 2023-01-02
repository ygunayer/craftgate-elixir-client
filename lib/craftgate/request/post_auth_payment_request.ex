defmodule Craftgate.Request.PostAuthPaymentRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.PostAuthPaymentRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/PostAuthPaymentRequest.java)
  """

  use Craftgate.Serializable, [
    paid_price: :decimal
  ]
end
