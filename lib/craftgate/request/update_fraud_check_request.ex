defmodule Craftgate.Request.UpdateFraudCheckRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.UpdateFraudCheckRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/UpdateFraudCheckRequest.java)
  """

  use Craftgate.Serializable, [
    check_status: Craftgate.Model.FraudCheckStatus
  ]
end
