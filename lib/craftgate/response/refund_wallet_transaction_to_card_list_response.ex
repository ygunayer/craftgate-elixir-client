defmodule Craftgate.Response.RefundWalletTransactionToCardListResponse do
  use Craftgate.Serializable, [
    items: {:array, Craftgate.Response.RefundWalletTransactionToCardResponse}
  ]
end
