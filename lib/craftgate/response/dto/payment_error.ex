defmodule Craftgate.Response.Dto.PaymentError do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PaymentError](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PaymentError.java)
  """

  use Craftgate.Serializable, [
    error_code: :string,
    error_description: :string,
    error_group: :string
  ]
end
