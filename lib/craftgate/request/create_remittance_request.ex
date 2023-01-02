defmodule Craftgate.Request.CreateRemittanceRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.CreateRemittanceRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/CreateRemittanceRequest.java)
  """

  use Craftgate.Serializable, [
    member_id: :integer,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    description: :string,
    remittance_reason_type: Craftgate.Model.RemittanceReasonType
  ]
end
