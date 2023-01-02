defmodule Craftgate.Response.PaymentTransactionApprovalListResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.PaymentTransactionApprovalListResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/PaymentTransactionApprovalListResponse.java)
  """

  use Craftgate.Serializable, [
    size: :integer,
    items: {:array, Craftgate.Response.Dto.PaymentTransactionApproval}
  ]
end
