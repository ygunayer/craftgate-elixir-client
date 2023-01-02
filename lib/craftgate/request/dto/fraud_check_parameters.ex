defmodule Craftgate.Request.Dto.FraudCheckParameters do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.FraudCheckParameters](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/FraudCheckParameters.java)
  """

  use Craftgate.Serializable, [
    buyer_external_id: :string,
    buyer_phone_number: :string,
    buyer_email: :string
  ]
end
