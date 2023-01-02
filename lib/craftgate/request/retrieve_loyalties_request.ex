defmodule Craftgate.Request.RetrieveLoyaltiesRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.RetrieveLoyaltiesRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/RetrieveLoyaltiesRequest.java)
  """

  use Craftgate.Serializable, [
    card_number: :string,
    expire_year: :string,
    expire_month: :string,
    cvc: :string,
    card_user_key: :string,
    card_token: :string
  ]
end
