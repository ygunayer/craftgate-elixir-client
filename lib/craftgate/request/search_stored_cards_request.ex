defmodule Craftgate.Request.SearchStoredCardsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchStoredCardsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchStoredCardsRequest.java)
  """

  use Craftgate.Serializable, [
    card_alias: :string,
    card_brand: :string,
    card_type: Craftgate.Model.CardType,
    card_user_key: :string,
    card_token: :string,
    card_bank_name: :string,
    card_association: Craftgate.Model.CardAssociation,
    card_expiry_status: Craftgate.Model.CardExpiryStatus,
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime,
    page: :integer,
    size: :integer
  ]
end
