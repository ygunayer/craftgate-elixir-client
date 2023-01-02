defmodule Craftgate.Response.ReportingPaymentTransactionRefundListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ReportingPaymentTransactionRefundListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ReportingPaymentTransactionRefundListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.ReportingPaymentTransactionRefundResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
