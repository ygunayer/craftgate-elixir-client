defmodule Craftgate.Response.InitCheckoutPaymentResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.InitCheckoutPaymentResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/InitCheckoutPaymentResponse.java)
  """

  use Craftgate.Serializable, [
    token: :string,
    page_url: :string,
    token_expire_date: :naive_datetime
  ]
end
