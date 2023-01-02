defmodule Craftgate.Response.MemberListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.MemberListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/MemberListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.MemberResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
