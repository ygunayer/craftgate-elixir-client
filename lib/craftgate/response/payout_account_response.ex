defmodule Craftgate.Response.PayoutAccountResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PayoutAccountResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PayoutAccountResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    type: Craftgate.Model.PayoutAccountType,
    external_account_id: :string,
    currency: :any,
    account_owner: Craftgate.Model.AccountOwner,
    sub_merchant_member_id: :integer
  ]
end
