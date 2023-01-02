defmodule Craftgate.Request.Dto.Card do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.Card](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/Card.java)
  """

  use Craftgate.Serializable, [
    card_holder_name: :string,
    card_number: :string,
    expire_year: :string,
    expire_month: :string,
    cvc: :string,
    card_alias: :string,
    card_user_key: :string,
    card_token: :string,
    bin_number: :string,
    last_four_digits: :string,
    card_holder_identity_number: :string,
    loyalty: Craftgate.Model.Loyalty,
    store_card_after_success_payment: :boolean
  ]
end
