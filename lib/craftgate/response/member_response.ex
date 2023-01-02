defmodule Craftgate.Response.MemberResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.MemberResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/MemberResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    created_date: :naive_datetime,
    updated_date: :naive_datetime,
    status: Craftgate.Model.Status,
    is_buyer: :boolean,
    is_sub_merchant: :boolean,
    member_type: Craftgate.Model.MemberType,
    member_external_id: :string,
    name: :string,
    email: :string,
    address: :string,
    phone_number: :string,
    identity_number: :string,
    contact_name: :string,
    contact_surname: :string,
    legal_company_title: :string,
    tax_office: :string,
    tax_number: :string,
    settlement_earnings_destination: Craftgate.Model.SettlementEarningsDestination,
    negative_wallet_amount_limit: :decimal,
    iban: :string
  ]
end
