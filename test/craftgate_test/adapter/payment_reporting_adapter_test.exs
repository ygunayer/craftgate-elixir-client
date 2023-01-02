defmodule CraftgateTest.Adapter.PaymentReportingAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Request.SearchPaymentTransactionRefundsRequest
  alias Craftgate.Request.SearchPaymentRefundsRequest
  alias Craftgate.Model.Currency
  alias Craftgate.Request.SearchPaymentsRequest
  alias Craftgate.Adapter.PaymentReportingAdapter

  test_endpoint(
    "search_payments/1",
    when:
      PaymentReportingAdapter.search_payments(%SearchPaymentsRequest{
        currency: Currency.try(),
        bin_number: "12345678",
        min_created_date: NaiveDateTime.new!(2023, 2, 17, 15, 6, 0)
      }),
    expect: [
      get:
        "/payment-reporting/v1/payments?binNumber=12345678&currency=TRY&minCreatedDate=2023-02-17T15:06:00"
    ]
  )

  test_endpoint(
    "retrieve_payment/1",
    when: PaymentReportingAdapter.retrieve_payment(42),
    expect: [
      get: "/payment-reporting/v1/payments/42"
    ]
  )

  test_endpoint(
    "retrieve_payment_transactions/1",
    when: PaymentReportingAdapter.retrieve_payment_transactions(42),
    expect: [
      get: "/payment-reporting/v1/payments/42/transactions"
    ]
  )

  test_endpoint(
    "retrieve_payment_refunds/1",
    when: PaymentReportingAdapter.retrieve_payment_refunds(42),
    expect: [
      get: "/payment-reporting/v1/payments/42/refunds"
    ]
  )

  test_endpoint(
    "retrieve_payment_transaction_refunds/2",
    when: PaymentReportingAdapter.retrieve_payment_transaction_refunds(42, 1042),
    expect: [
      get: "/payment-reporting/v1/payments/42/transactions/1042/refunds"
    ]
  )

  test_endpoint(
    "search_payment_refunds/1",
    when:
      PaymentReportingAdapter.search_payment_refunds(%SearchPaymentRefundsRequest{
        min_refund_price: Decimal.new("100.0"),
        page: 2,
        size: 50
      }),
    expect: [
      get: "/payment-reporting/v1/refunds?minRefundPrice=100.0&page=2&size=50"
    ]
  )

  test_endpoint(
    "search_payment_transaction_refunds/1",
    when:
      PaymentReportingAdapter.search_payment_transaction_refunds(
        %SearchPaymentTransactionRefundsRequest{
          payment_id: 42,
          currency: Currency.usd(),
          is_after_settlement: true
        }
      ),
    expect: [
      get:
        "/payment-reporting/v1/refund-transactions?currency=USD&isAfterSettlement=true&paymentId=42"
    ]
  )
end
