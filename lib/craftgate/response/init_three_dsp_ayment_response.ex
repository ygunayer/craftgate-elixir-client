defmodule Craftgate.Response.InitThreeDSPaymentResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.InitThreeDSPaymentResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/InitThreeDSPaymentResponse.java)
  """

  use Craftgate.Serializable, [
    html_content: :string
  ]
end
