defmodule CraftgateTest.Adapter.SettlementAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Request.SearchPayoutAccountRequest
  alias Craftgate.Request.UpdatePayoutAccountRequest
  alias Craftgate.Model.PayoutAccountType
  alias Craftgate.Model.Currency
  alias Craftgate.Model.AccountOwner
  alias Craftgate.Request.CreatePayoutAccountRequest
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

  test_endpoint(
    "create_payout_account/1",
    when:
      SettlementAdapter.create_payout_account(%CreatePayoutAccountRequest{
        account_owner: AccountOwner.merchant(),
        currency: Currency.usd(),
        external_account_id: "wiseRecipientId",
        type: PayoutAccountType.wise()
      }),
    expect: [
      post: "/settlement/v1/payout-accounts",
      body: @fixture_request_create_payout_account
    ]
  )

  test_endpoint(
    "update_payout_account/2",
    when:
      SettlementAdapter.update_payout_account(42, %UpdatePayoutAccountRequest{
        external_account_id: "wiseRecipientId2"
      }),
    expect: [
      put: "/settlement/v1/payout-accounts/42",
      body: @fixture_request_update_payout_account
    ]
  )

  test_endpoint(
    "delete_payout_account/1",
    when: SettlementAdapter.delete_payout_account(42),
    expect: [
      delete: "/settlement/v1/payout-accounts/42"
    ]
  )

  test_endpoint(
    "search_payout_accounts/1",
    when:
      SettlementAdapter.search_payout_accounts(%SearchPayoutAccountRequest{
        account_owner: AccountOwner.sub_merchant_member(),
        currency: Currency.eur()
      }),
    expect: [
      get: "/settlement/v1/payout-accounts?accountOwner=SUB_MERCHANT_MEMBER&currency=EUR"
    ]
  )
end
