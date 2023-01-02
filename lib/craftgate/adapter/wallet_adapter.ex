defmodule Craftgate.Adapter.WalletAdapter do
  @moduledoc """
  Provides capabilities to manage member wallets, search for wallet transactions, and send or receive remittance
  """

  use Craftgate.Adapter

  alias Craftgate.Request.CreateRemittanceRequest
  alias Craftgate.Request.CreateWalletRequest
  alias Craftgate.Request.CreateWithdrawRequest
  alias Craftgate.Request.RefundWalletTransactionToCardRequest
  alias Craftgate.Request.ResetMerchantMemberWalletBalanceRequest
  alias Craftgate.Request.SearchWalletTransactionsRequest
  alias Craftgate.Request.SearchWithdrawsRequest
  alias Craftgate.Request.UpdateWalletRequest
  alias Craftgate.Response.RefundWalletTransactionListResponse
  alias Craftgate.Response.RefundWalletTransactionResponse
  alias Craftgate.Response.RemittanceResponse
  alias Craftgate.Response.WalletResponse
  alias Craftgate.Response.WalletTransactionListResponse
  alias Craftgate.Response.WalletTransactionRefundableAmountResponse
  alias Craftgate.Response.WithdrawListResponse
  alias Craftgate.Response.WithdrawResponse

  endpoint create_wallet(member_id: integer(), body: CreateWalletRequest.t()), post: "/wallet/v1/members/:member_id/wallets", return: WalletResponse.t()

  endpoint retrieve_member_wallet(member_id: integer()), get: "/wallet/v1/members/:member_id/wallet", return: WalletResponse.t()

  endpoint search_wallet_transactions(wallet_id: integer(), params: SearchWalletTransactionsRequest.t()), get: "/wallet/v1/wallets/:wallet_id/wallet-transactions", return: WalletTransactionListResponse.t()

  endpoint update_wallet(member_id: integer(), wallet_id: integer(), body: UpdateWalletRequest.t()), put: "/wallet/v1/members/:member_id/wallets/:wallet_id", return: WalletResponse.t()

  endpoint send_remittance(body: CreateRemittanceRequest.t()), post: "/wallet/v1/remittances/send", return: RemittanceResponse.t()

  endpoint receive_remittance(body: CreateRemittanceRequest.t()), post: "/wallet/v1/remittances/receive", return: RemittanceResponse.t()

  endpoint retrieve_remittance(id: integer()), get: "/wallet/v1/remittances/:id", return: RemittanceResponse.t()

  endpoint retrieve_merchant_member_wallet(), get: "/wallet/v1/merchants/me/wallet", return: WalletResponse.t()

  endpoint reset_merchant_member_wallet_balance(body: ResetMerchantMemberWalletBalanceRequest.t()), post: "/wallet/v1/merchants/me/wallet/reset-balance", return: WalletResponse.t()

  endpoint retrieve_refundable_amount_of_wallet_transaction(wallet_transaction_id: integer()), get: "/payment/v1/wallet-transactions/:wallet_transaction_id/refundable-amount", return: WalletTransactionRefundableAmountResponse.t()

  endpoint refund_wallet_transaction(wallet_transaction_id: integer(), body: RefundWalletTransactionToCardRequest.t()), post: "/payment/v1/wallet-transactions/:wallet_transaction_id/refunds", return: RefundWalletTransactionResponse.t()

  endpoint retrieve_refund_wallet_transaction(wallet_transaction_id: integer()), get: "/payment/v1/wallet-transactions/:wallet_transaction_id/refunds", return: RefundWalletTransactionListResponse.t()

  endpoint create_withdraw(body: CreateWithdrawRequest.t()), post: "/wallet/v1/withdraws", return: WithdrawResponse.t()

  endpoint cancel_withdraw(id: integer()), post: "/wallet/v1/withdraws/:id/cancel", return: WithdrawResponse.t()

  endpoint retrieve_withdraw(id: integer()), get: "/wallet/v1/withdraws/:id", return: WithdrawResponse.t()

  endpoint search_withdraws(params: SearchWithdrawsRequest.t()), get: "/wallet/v1/withdraws", return: WithdrawListResponse.t()
end
