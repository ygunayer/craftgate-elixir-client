defmodule Craftgate.Response.StoredCardListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.StoredCardListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/StoredCardListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.StoredCardResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
