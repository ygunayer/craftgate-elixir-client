defmodule Craftgate.Response.Dto.Installment do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.Installment](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/Installment.java)
  """

  use Craftgate.Serializable, [
    bin_number: :string,
    price: :decimal,
    card_type: Craftgate.Model.CardType,
    card_association: Craftgate.Model.CardAssociation,
    card_brand: :string,
    bank_name: :string,
    bank_code: :integer,
    force_3ds: :boolean,
    cvc_required: :boolean,
    commercial: :boolean,
    installment_prices: {:array, Craftgate.Response.Dto.InstallmentPrice}
  ]
end
