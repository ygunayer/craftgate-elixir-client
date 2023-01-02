defmodule Craftgate.Response.FraudAllValueListsResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.FraudAllValueListsResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/FraudAllValueListsResponse.java)
  """

  use Craftgate.Serializable, [
    items: {:array, Craftgate.Response.FraudValueListResponse}
  ]
end
