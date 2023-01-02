defmodule Craftgate.Response.ProductResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ProductResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ProductResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    name: :string,
    description: :string,
    order_id: :string,
    conversation_id: :string,
    external_id: :string,
    status: Craftgate.Model.Status,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    stock: :integer,
    sold_count: :integer,
    token: :string,
    enabled_installments: {:array, :integer},
    url: :string,
    qr_code_url: :string,
    channel: :string
  ]
end
