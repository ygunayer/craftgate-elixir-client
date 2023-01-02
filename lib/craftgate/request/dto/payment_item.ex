defmodule Craftgate.Request.Dto.PaymentItem do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.dto.PaymentItem](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/dto/PaymentItem.java)
  """

  use Craftgate.Serializable, [
    name: :string,
    price: :decimal,
    external_id: :string,
    sub_merchant_member_id: :integer,
    sub_merchant_member_price: :decimal
  ]
end
