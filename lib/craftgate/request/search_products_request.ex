defmodule Craftgate.Request.SearchProductsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchProductsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchProductsRequest.java)
  """

  use Craftgate.Serializable, [
    name: :string,
    min_price: :decimal,
    max_price: :decimal,
    currency: Craftgate.Model.Currency,
    channel: :string,
    page: :integer,
    size: :integer
  ]
end
