defmodule Craftgate.Response.CheckMasterpassUserResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.CheckMasterpassUserResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/CheckMasterpassUserResponse.java)
  """

  use Craftgate.Serializable, [
    is_eligible_to_use_masterpass: :boolean,
    is_any_card_saved_in_customer_program: :boolean,
    has_masterpass_account: :boolean,
    hash_any_card_saved_in_masterpass_account: :boolean,
    is_masterpass_account_linked_with_merchant: :boolean,
    is_masterpass_account_locked: :boolean,
    is_phone_number_updated_in_another_merchant: :boolean,
    account_status: :string
  ]
end
