defmodule Craftgate.Response.RemittanceResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.RemittanceResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/RemittanceResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    created_date: :naive_datetime,
    status: Craftgate.Model.Status,
    price: :decimal,
    currency: Craftgate.Model.Currency,
    member_id: :integer,
    remittance_type: Craftgate.Model.RemittanceType,
    remittance_reason_type: Craftgate.Model.RemittanceReasonType,
    description: :string
  ]
end
