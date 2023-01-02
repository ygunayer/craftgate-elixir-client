defmodule Craftgate.Response.Dto.PayoutBouncedTransaction do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PayoutBouncedTransaction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PayoutBouncedTransaction.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    iban: :string,
    created_date: :naive_datetime,
    updated_date: :naive_datetime,
    payout_id: :integer,
    payout_amount: :decimal,
    contact_name: :string,
    contact_surname: :string,
    legal_company_title: :string,
    row_description: :string
  ]
end
