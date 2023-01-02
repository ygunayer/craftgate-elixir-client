defmodule Craftgate.Response.InstallmentListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.InstallmentListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/InstallmentListResponse.java)
  """

  use Craftgate.Serializable, [
    items: {:array, Craftgate.Response.Dto.Installment}
  ]
end
