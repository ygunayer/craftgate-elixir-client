defmodule Craftgate.Adapter.SettlementAdapter do
  @moduledoc """
  Provides capabilities to initiate settlement operations like creating instant wallet settlements
  """

  use Craftgate.Adapter

  alias Craftgate.Request.CreateInstantWalletSettlementRequest
  alias Craftgate.Request.CreatePayoutAccountRequest
  alias Craftgate.Request.SearchPayoutAccountRequest
  alias Craftgate.Request.UpdatePayoutAccountRequest
  alias Craftgate.Response.PayoutAccountListResponse
  alias Craftgate.Response.PayoutAccountResponse
  alias Craftgate.Response.SettlementResponse

  endpoint create_instant_wallet_settlement(body: CreateInstantWalletSettlementRequest.t()), post: "/settlement/v1/instant-wallet-settlements", return: SettlementResponse.t()

  endpoint create_payout_account(body: CreatePayoutAccountRequest.t()), post: "/settlement/v1/payout-accounts", return: PayoutAccountResponse.t()

  endpoint update_payout_account(id: integer(), body: UpdatePayoutAccountRequest.t()), put: "/settlement/v1/payout-accounts/:id", return: PayoutAccountResponse.t()

  endpoint delete_payout_account(id: integer()), delete: "/settlement/v1/payout-accounts/:id"

  endpoint search_payout_accounts(params: SearchPayoutAccountRequest.t()), get: "/settlement/v1/payout-accounts", return: PayoutAccountListResponse.t()

end
