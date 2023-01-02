defmodule CraftgateTest.Adapter.SettlementAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Request.CreateInstantWalletSettlementRequest
  alias Craftgate.Adapter.SettlementAdapter

  test_endpoint(
    "create_instant_wallet_settlement/1",
    when:
      SettlementAdapter.create_instant_wallet_settlement(%CreateInstantWalletSettlementRequest{
        excluded_sub_merchant_member_ids: [42, 103, 55]
      }),
    expect: [
      post: "/settlement/v1/instant-wallet-settlements",
      body: @fixture_request_create_instant_wallet_settlement
    ]
  )
end
