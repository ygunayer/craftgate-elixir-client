defmodule Craftgate.Response.RetrieveLoyaltiesResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.RetrieveLoyaltiesResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/RetrieveLoyaltiesResponse.java)
  """

  use Craftgate.Serializable, [
    card_brand: :string,
    force_3ds: :boolean,
    pos: Craftgate.Response.Dto.MerchantPos,
    loyalties: {:array, Craftgate.Model.Loyalty}
  ]
end
