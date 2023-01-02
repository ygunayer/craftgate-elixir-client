defmodule Craftgate.Response.FraudValueListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.FraudValueListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/FraudValueListResponse.java)
  """

  use Craftgate.Serializable, [
    name: :string,
    values: {:array, Craftgate.Model.FraudValue}
  ]
end
