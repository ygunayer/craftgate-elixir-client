defmodule Craftgate.Response.Dto.PayoutDetailTransaction do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PayoutDetailTransaction](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PayoutDetailTransaction.java)
  """

  use Craftgate.Serializable, [
    transaction_id: :integer,
    transaction_type: :string,
    payout_amount: :decimal
  ]
end
