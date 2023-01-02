defmodule Craftgate.Response.ReportingPaymentListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ReportingPaymentListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ReportingPaymentListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.ReportingPaymentResponse,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
