defmodule CraftgateTest.Adapter.WalletAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Request.CreateWithdrawRequest
  alias Craftgate.Request.RefundWalletTransactionToCardRequest
  alias Craftgate.Model.RemittanceReasonType
  alias Craftgate.Request.CreateRemittanceRequest
  alias Craftgate.Request.UpdateWalletRequest
  alias Craftgate.Model.WalletTransactionType
  alias Craftgate.Request.SearchWalletTransactionsRequest
  alias Craftgate.Model.Currency
  alias Craftgate.Request.CreateWalletRequest
  alias Craftgate.Adapter.WalletAdapter
  alias Craftgate.Request.ResetMerchantMemberWalletBalanceRequest
  alias Craftgate.Request.SearchWithdrawsRequest

  test_endpoint(
    "create_wallet/2",
    when:
      WalletAdapter.create_wallet(42, %CreateWalletRequest{
        currency: Currency.try(),
        negative_amount_limit: Decimal.new("1.0")
      }),
    expect: [
      post: "/wallet/v1/members/42/wallets",
      body: @fixture_request_create_wallet
    ]
  )

  test_endpoint(
    "retrieve_member_wallet/1",
    when: WalletAdapter.retrieve_member_wallet(42),
    expect: [
      get: "/wallet/v1/members/42/wallet"
    ]
  )

  test_endpoint(
    "search_wallet_transactions/2",
    when:
      WalletAdapter.search_wallet_transactions(42, %SearchWalletTransactionsRequest{
        max_amount: Decimal.new("200.0"),
        min_amount: Decimal.new("100.0"),
        wallet_transaction_types: [
          WalletTransactionType.deposit_from_card(),
          WalletTransactionType.withdraw()
        ]
      }),
    expect: [
      get:
        "/wallet/v1/wallets/42/wallet-transactions?maxAmount=200.0&minAmount=100.0&walletTransactionTypes=DEPOSIT_FROM_CARD,WITHDRAW"
    ]
  )

  test_endpoint(
    "update-wallet/3",
    when:
      WalletAdapter.update_wallet(42, 1042, %UpdateWalletRequest{
        negative_amount_limit: Decimal.new("0.0")
      }),
    expect: [
      put: "/wallet/v1/members/42/wallets/1042",
      body: @fixture_request_update_wallet
    ]
  )

  test_endpoint(
    "send_remittance/1",
    when:
      WalletAdapter.send_remittance(%CreateRemittanceRequest{
        currency: Currency.eur(),
        description: "foo",
        member_id: 42,
        price: Decimal.new("19.99"),
        remittance_reason_type: RemittanceReasonType.redeem_only_loyalty()
      }),
    expect: [
      post: "/wallet/v1/remittances/send",
      body: @fixture_request_send_remittance
    ]
  )

  test_endpoint(
    "receive_remittance/1",
    when:
      WalletAdapter.receive_remittance(%CreateRemittanceRequest{
        currency: Currency.usd(),
        description: "bar",
        member_id: 15,
        price: Decimal.new("3.14"),
        remittance_reason_type: RemittanceReasonType.submerchant_send_receive()
      }),
    expect: [
      post: "/wallet/v1/remittances/receive",
      body: @fixture_request_receive_remittance
    ]
  )

  test_endpoint(
    "retrieve_remittance/1",
    when: WalletAdapter.retrieve_remittance(42),
    expect: [
      get: "/wallet/v1/remittances/42"
    ]
  )

  test_endpoint(
    "retrieve_merchant_member_wallet/0",
    when: WalletAdapter.retrieve_merchant_member_wallet(),
    expect: [
      get: "/wallet/v1/merchants/me/wallet"
    ]
  )

  test_endpoint(
    "reset_merchant_member_wallet_balance/1",
    when:
      WalletAdapter.reset_merchant_member_wallet_balance(%ResetMerchantMemberWalletBalanceRequest{
        wallet_amount: Decimal.new("20.0")
      }),
    expect: [
      post: "/wallet/v1/merchants/me/wallet/reset-balance",
      body: @fixture_request_reset_merchant_member_wallet_balance
    ]
  )

  test_endpoint(
    "retrieve_refundable_amount_of_wallet_transaction/1",
    when: WalletAdapter.retrieve_refundable_amount_of_wallet_transaction(42),
    expect: [
      get: "/payment/v1/wallet-transactions/42/refundable-amount"
    ]
  )

  test_endpoint(
    "refund_wallet_transaction/2",
    when:
      WalletAdapter.refund_wallet_transaction(42, %RefundWalletTransactionToCardRequest{
        refund_price: Decimal.new("100.0")
      }),
    expect: [
      post: "/payment/v1/wallet-transactions/42/refunds",
      body: @fixture_request_refund_wallet_transaction
    ]
  )

  test_endpoint(
    "retrieve_refund_wallet_transactions/1",
    when: WalletAdapter.retrieve_refund_wallet_transaction(42),
    expect: [
      get: "/payment/v1/wallet-transactions/42/refunds"
    ]
  )

  test_endpoint(
    "create_withdraw/1",
    when:
      WalletAdapter.create_withdraw(%CreateWithdrawRequest{
        currency: Currency.try(),
        description: "foo",
        member_id: 42,
        price: Decimal.new("100.0")
      }),
    expect: [
      post: "/wallet/v1/withdraws",
      body: @fixture_request_create_withdraw
    ]
  )

  test_endpoint(
    "cancel_withdraw/1",
    when: WalletAdapter.cancel_withdraw(42),
    expect: [
      post: "/wallet/v1/withdraws/42/cancel"
    ]
  )

  test_endpoint(
    "retrieve_withdraw/1",
    when: WalletAdapter.retrieve_withdraw(42),
    expect: [
      get: "/wallet/v1/withdraws/42"
    ]
  )

  test_endpoint(
    "search_withdraws/1",
    when:
      WalletAdapter.search_withdraws(%SearchWithdrawsRequest{
        currency: Currency.try(),
        member_id: 42
      }),
    expect: [
      get: "/wallet/v1/withdraws?currency=TRY&memberId=42"
    ]
  )
end
