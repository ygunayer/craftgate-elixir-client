defmodule Craftgate.Response.FraudCheckListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.FraudCheckListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/FraudCheckListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.Dto.FraudCheck,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
