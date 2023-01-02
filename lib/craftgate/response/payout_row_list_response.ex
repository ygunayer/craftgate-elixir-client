defmodule Craftgate.Response.PayoutRowListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PayoutRowListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PayoutRowListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.Dto.PayoutRow,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
