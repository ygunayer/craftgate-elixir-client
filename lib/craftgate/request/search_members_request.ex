defmodule Craftgate.Request.SearchMembersRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchMembersRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchMembersRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    is_buyer: :boolean,
    is_sub_merchant: :boolean,
    name: :string,
    member_ids: {:array, :integer},
    member_type: Craftgate.Model.MemberType,
    member_external_id: :string
  ]
end
