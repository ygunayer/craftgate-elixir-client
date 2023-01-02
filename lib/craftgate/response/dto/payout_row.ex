defmodule Craftgate.Response.Dto.PayoutRow do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PayoutRow](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PayoutRow.java)
  """

  use Craftgate.Serializable, [
    name: :string,
    iban: :string,
    payout_id: :integer,
    merchant_id: :integer,
    merchant_type: :string,
    payout_amount: :decimal,
    payout_date: :naive_datetime
  ]
end
