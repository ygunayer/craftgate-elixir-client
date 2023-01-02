defmodule Craftgate.Response.WithdrawListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.WithdrawListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/WithdrawListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.WithdrawResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
