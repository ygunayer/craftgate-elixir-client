defmodule Craftgate.Response.RefundWalletTransactionResponse do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.RefundWalletTransactionResponse](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/RefundWalletTransactionResponse.java)
  """

  use Craftgate.Serializable, [
    id: :integer,
    created_date: :naive_datetime,
    refund_status: Craftgate.Model.RefundStatus,
    refund_price: :decimal,
    auth_code: :string,
    host_reference: :string,
    trans_id: :string,
    transaction_id: :integer,
    transaction_type: Craftgate.Model.WalletTransactionRefundCardTransactionType,
    payment_error: Craftgate.Response.Dto.PaymentError,
    wallet_transaction_id: :integer
  ]
end
