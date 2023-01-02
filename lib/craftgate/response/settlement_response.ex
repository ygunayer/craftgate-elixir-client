defmodule Craftgate.Response.SettlementResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.SettlementResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/SettlementResponse.java)
  """

  use Craftgate.Serializable, [
    settlement_result_status: Craftgate.Model.SettlementResultStatus
  ]
end
