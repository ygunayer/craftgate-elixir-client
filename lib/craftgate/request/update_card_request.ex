defmodule Craftgate.Request.UpdateCardRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.UpdateCardRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/UpdateCardRequest.java)
  """

  use Craftgate.Serializable, [
    card_user_key: :string,
    card_token: :string,
    expire_year: :string,
    expire_month: :string
  ]
end
