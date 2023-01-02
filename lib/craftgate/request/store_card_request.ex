defmodule Craftgate.Request.StoreCardRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.StoreCardRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/StoreCardRequest.java)
  """

  use Craftgate.Serializable, [
    card_holder_name: :string,
    card_number: :string,
    expire_year: :string,
    expire_month: :string,
    card_alias: :string,
    card_user_key: :string
  ]
end
