defmodule Craftgate.Request.FraudValueListRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.FraudValueListRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/FraudValueListRequest.java)
  """

  use Craftgate.Serializable, [
    list_name: :string,
    value: :string,
    duration_in_seconds: :integer
  ]
end
