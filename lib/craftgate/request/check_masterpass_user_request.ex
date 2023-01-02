defmodule Craftgate.Request.CheckMasterpassUserRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CheckMasterpassUserRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CheckMasterpassUserRequest.java)
  """

  use Craftgate.Serializable, [
    masterpass_gsm_number: :string
  ]
end
