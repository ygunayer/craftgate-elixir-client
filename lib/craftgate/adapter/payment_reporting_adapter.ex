defmodule Craftgate.Adapter.PaymentReportingAdapter do
  @moduledoc """
  Provides capabilities to search for payments, retrieve payment details, retrieve payment transaction records, etc.
  """

  use Craftgate.Adapter

  alias Craftgate.Request.SearchPaymentRefundsRequest
  alias Craftgate.Request.SearchPaymentsRequest
  alias Craftgate.Request.SearchPaymentTransactionRefundsRequest
  alias Craftgate.Response.ReportingPaymentListResponse
  alias Craftgate.Response.ReportingPaymentRefundListResponse
  alias Craftgate.Response.ReportingPaymentResponse
  alias Craftgate.Response.ReportingPaymentTransactionListResponse
  alias Craftgate.Response.ReportingPaymentTransactionRefundListResponse

  endpoint search_payments(params: SearchPaymentsRequest.t()), get: "/payment-reporting/v1/payments", return: ReportingPaymentListResponse.t()

  endpoint retrieve_payment(id: integer()), get: "/payment-reporting/v1/payments/:id", return: ReportingPaymentResponse.t()

  endpoint retrieve_payment_transactions(payment_id: integer()), get: "/payment-reporting/v1/payments/:payment_id/transactions", return: ReportingPaymentTransactionListResponse.t()

  endpoint retrieve_payment_refunds(payment_id: integer()), get: "/payment-reporting/v1/payments/:payment_id/refunds", return: ReportingPaymentRefundListResponse.t()

  endpoint retrieve_payment_transaction_refunds(payment_id: integer(), payment_transaction_id: integer()), get: "/payment-reporting/v1/payments/:payment_id/transactions/:payment_transaction_id/refunds", return: ReportingPaymentTransactionRefundListResponse.t()

  endpoint search_payment_refunds(params: SearchPaymentRefundsRequest.t()), get: "/payment-reporting/v1/refunds", return: ReportingPaymentRefundListResponse.t()

  endpoint search_payment_transaction_refunds(params: SearchPaymentTransactionRefundsRequest.t()), get: "/payment-reporting/v1/refund-transactions", return: ReportingPaymentTransactionRefundListResponse.t()
end
