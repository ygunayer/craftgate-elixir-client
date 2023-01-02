defmodule Craftgate.Request.CreateWithdrawRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateWithdrawRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateWithdrawRequest.java)
  """

  use Craftgate.Serializable, [
    price: :decimal,
    member_id: :integer,
    description: :string,
    currency: Craftgate.Model.Currency
  ]
end
