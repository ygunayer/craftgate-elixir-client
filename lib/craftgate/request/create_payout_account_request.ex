defmodule Craftgate.Request.CreatePayoutAccountRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreatePayoutAccountRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreatePayoutAccountRequest.java)
  """

  use Craftgate.Serializable, [
    type: Craftgate.Model.PayoutAccountType,
    external_account_id: :string,
    currency: Craftgate.Model.Currency,
    account_owner: Craftgate.Model.AccountOwner,
    sub_merchant_member_id: :integer
  ]
end
