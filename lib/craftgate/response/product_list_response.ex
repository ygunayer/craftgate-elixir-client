defmodule Craftgate.Response.ProductListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ProductListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ProductListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.ProductResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
