defmodule Craftgate.Request.UpdatePayoutAccountRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.UpdatePayoutAccountRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/UpdatePayoutAccountRequest.java)
  """

  use Craftgate.Serializable, [
    type: Craftgate.Model.PayoutAccountType,
    external_account_id: :string
  ]
end
