defmodule Craftgate.Request.UpdateMemberRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.UpdateMemberRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/UpdateMemberRequest.java)
  """

  use Craftgate.Serializable, [
    name: :string,
    address: :string,
    email: :string,
    phone_number: :string,
    identity_number: :string,
    contact_name: :string,
    contact_surname: :string,
    member_type: Craftgate.Model.MemberType,
    legal_company_title: :string,
    tax_office: :string,
    tax_number: :string,
    iban: :string,
    settlement_earnings_destination: Craftgate.Model.SettlementEarningsDestination,
    negative_wallet_amount_limit: :decimal,
    is_buyer: :boolean,
    is_sub_merchant: :boolean
  ]
end
