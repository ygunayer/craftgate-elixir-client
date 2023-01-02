defmodule Craftgate.Response.ReportingPaymentRefundListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ReportingPaymentRefundListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ReportingPaymentRefundListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.ReportingPaymentRefundResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
