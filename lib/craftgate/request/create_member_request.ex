defmodule Craftgate.Request.CreateMemberRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateMemberRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateMemberRequest.java)
  """

  use Craftgate.Serializable, [
    member_external_id: :string,
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
    negative_wallet_amount_limit: :decimal,
    is_buyer: :boolean,
    is_sub_merchant: :boolean
  ]
end
