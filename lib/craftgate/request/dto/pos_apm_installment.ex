defmodule Craftgate.Request.Dto.PosApmInstallment do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.PosApmInstallment](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/PosApmInstallment.java)
  """

  use Craftgate.Serializable, [
    number: :integer,
    total_price: :decimal
  ]
end
