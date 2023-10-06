defmodule Craftgate.Request.SearchPayoutAccountRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPayoutAccountRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPayoutAccountRequest.java)
  """

  use Craftgate.Serializable, [
    currency: Craftgate.Model.Currency,
    account_owner: Craftgate.Model.AccountOwner,
    sub_merchant_member_id: :integer,
    page: :integer,
    size: :integer
  ]
end
