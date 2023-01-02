defmodule Craftgate.Request.CreateProductRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateProductRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateProductRequest.java)
  """

  use Craftgate.Serializable, [
    name: :string,
    channel: :string,
    order_id: :string,
    conversation_id: :string,
    external_id: :string,
    stock: :integer,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    description: :string,
    enabled_installments: {:array, :integer}
  ]
end
