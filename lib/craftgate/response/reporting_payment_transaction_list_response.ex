defmodule Craftgate.Response.ReportingPaymentTransactionListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.ReportingPaymentTransactionListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/ReportingPaymentTransactionListResponse.java)
  """

  use Craftgate.Serializable, [
    items: Craftgate.Response.Dto.ReportingPaymentTransaction,
    page: :integer,
    size: :integer,
    total_size: :integer
  ]
end
