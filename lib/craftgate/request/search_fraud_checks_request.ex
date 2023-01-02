defmodule Craftgate.Request.SearchFraudChecksRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchFraudChecksRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchFraudChecksRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    action: Craftgate.Model.FraudAction,
    check_status: Craftgate.Model.FraudCheckStatus,
    min_created_date: :naive_datetime,
    max_created_date: :naive_datetime,
    rule_id: :integer,
    payment_id: :integer,
    payment_status: Craftgate.Model.PaymentStatus
  ]
end
