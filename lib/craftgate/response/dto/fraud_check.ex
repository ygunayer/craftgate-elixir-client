defmodule Craftgate.Response.Dto.FraudCheck do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.FraudCheck](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/FraudCheck.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    status: Craftgate.Model.Status,
    action: Craftgate.Model.FraudAction,
    check_status: Craftgate.Model.FraudCheckStatus,
    payment_data: Craftgate.Request.Dto.FraudPaymentData,
    rule_id: :integer,
    rule_name: :string,
    rule_conditions: :string,
    payment_id: :integer,
    payment_status: Craftgate.Model.PaymentStatus
  ]
end
