defmodule Craftgate.Response.StoredCardResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.StoredCardResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/StoredCardResponse.java)
  """

  use Craftgate.Serializable, [
    bin_number: :string,
    last_four_digits: :string,
    card_user_key: :string,
    card_token: :string,
    card_alias: :string,
    card_type: Craftgate.Model.CardType,
    card_association: Craftgate.Model.CardAssociation,
    card_brand: :string,
    card_bank_name: :string,
    card_bank_id: :integer,
    card_expiry_status: Craftgate.Model.CardExpiryStatus
  ]
end
