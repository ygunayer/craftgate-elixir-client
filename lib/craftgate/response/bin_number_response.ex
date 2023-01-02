defmodule Craftgate.Response.BinNumberResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.BinNumberResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/BinNumberResponse.java)
  """

  use Craftgate.Serializable, [
    bin_number: :string,
    card_type: Craftgate.Model.CardType,
    card_association: Craftgate.Model.CardAssociation,
    card_brand: :string,
    bank_name: :string,
    bank_code: :integer,
    commercial: :boolean
  ]
end
