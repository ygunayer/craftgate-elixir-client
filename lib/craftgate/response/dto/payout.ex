defmodule Craftgate.Response.Dto.Payout do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.Payout](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/Payout.java)
  """

  use Craftgate.Serializable, [
    currency: Craftgate.Model.Currency,
    parity: :decimal,
    paid_price: :decimal,
    merchant_payout_amount: :decimal,
    sub_merchant_member_payout_amount: :decimal
  ]
end
