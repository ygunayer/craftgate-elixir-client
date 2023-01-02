defmodule Craftgate.Response.Dto.MerchantPos do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.MerchantPos](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/MerchantPos.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    name: :string,
    alias: :string,
    bank_id: :integer
  ]
end
