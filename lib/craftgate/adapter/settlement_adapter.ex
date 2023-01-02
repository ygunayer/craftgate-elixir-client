defmodule Craftgate.Adapter.SettlementAdapter do
  @moduledoc """
  Provides capabilities to initiate settlement operations like creating instant wallet settlements
  """

  use Craftgate.Adapter

  alias Craftgate.Request.CreateInstantWalletSettlementRequest
  alias Craftgate.Response.SettlementResponse

  endpoint create_instant_wallet_settlement(body: CreateInstantWalletSettlementRequest.t()), post: "/settlement/v1/instant-wallet-settlements", return: SettlementResponse.t()
end
