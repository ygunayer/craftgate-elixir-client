defmodule Craftgate.Request.Dto.CustomInstallment do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.CustomInstallment](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/CustomInstallment.java)
  """

  use Craftgate.Serializable, [
    number: :integer,
    total_price: :decimal
  ]
end
