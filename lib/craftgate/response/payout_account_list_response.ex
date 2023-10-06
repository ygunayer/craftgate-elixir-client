defmodule Craftgate.Response.PayoutAccountListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PayoutAccountListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PayoutAccountListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.PayoutAccountResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
