defmodule Craftgate.Request.Dto.GarantiPayInstallment do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.GarantiPayInstallment](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/GarantiPayInstallment.java)
  """

  use Craftgate.Serializable, [
    number: :integer,
    total_price: :decimal
  ]
end
