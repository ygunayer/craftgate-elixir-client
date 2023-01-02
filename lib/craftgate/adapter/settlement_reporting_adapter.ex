defmodule Craftgate.Adapter.SettlementReportingAdapter do
  @moduledoc """
  Provides capabilities to retrieve information about settlement operations like searching for payout completed or bounced transactions
  """

  use Craftgate.Adapter

  alias Craftgate.Request.SearchPayoutBouncedTransactionsRequest
  alias Craftgate.Request.SearchPayoutCompletedTransactionsRequest
  alias Craftgate.Request.SearchPayoutRowsRequest
  alias Craftgate.Response.PayoutBouncedTransactionListResponse
  alias Craftgate.Response.PayoutCompletedTransactionListResponse
  alias Craftgate.Response.PayoutDetailResponse
  alias Craftgate.Response.PayoutRowListResponse

  endpoint search_payout_completed_transactions(params: SearchPayoutCompletedTransactionsRequest.t()), get: "/settlement-reporting/v1/settlement-file/payout-completed-transactions", return: PayoutCompletedTransactionListResponse.t()

  endpoint search_bounced_payout_transactions(params: SearchPayoutBouncedTransactionsRequest.t()), get: "/settlement-reporting/v1/settlement-file/bounced-sub-merchant-rows", return: PayoutBouncedTransactionListResponse.t()

  endpoint retrieve_payout_details(id: integer()), get: "/settlement-reporting/v1/settlement-file/payout-details/:id", return: PayoutDetailResponse.t()

  endpoint search_payout_rows(params: SearchPayoutRowsRequest.t()), get: "/settlement-reporting/v1/settlement-file/settlement-file-rows", return: PayoutRowListResponse.t()
end
