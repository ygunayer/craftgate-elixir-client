defmodule Craftgate.Response.Dto.PaymentTransactionApproval do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.PaymentTransactionApproval](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/PaymentTransactionApproval.java)
  """

  use Craftgate.Serializable, [
    payment_transaction_id: :integer,
    approval_status: Craftgate.Model.ApprovalStatus,
    failed_reason: :string
  ]
end
