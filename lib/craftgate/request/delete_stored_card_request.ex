defmodule Craftgate.Request.DeleteStoredCardRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.DeleteStoredCardRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/DeleteStoredCardRequest.java)
  """

  use Craftgate.Serializable, [
    card_user_key: :string,
    card_token: :string
  ]
end
