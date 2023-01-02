defmodule CraftgateTest.Adapter.SettlementReportingAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Model.FileStatus
  alias Craftgate.Request.SearchPayoutBouncedTransactionsRequest
  alias Craftgate.Request.SearchPayoutCompletedTransactionsRequest
  alias Craftgate.Request.SearchPayoutRowsRequest
  alias Craftgate.Adapter.SettlementReportingAdapter

  test_endpoint(
    "search_payout_completed_transactions/1",
    when:
      SettlementReportingAdapter.search_payout_completed_transactions(
        %SearchPayoutCompletedTransactionsRequest{
          start_date: NaiveDateTime.new!(2023, 1, 1, 0, 0, 0),
          end_date: NaiveDateTime.new!(2023, 1, 2, 0, 0, 0)
        }
      ),
    expect: [
      get:
        "/settlement-reporting/v1/settlement-file/payout-completed-transactions?endDate=2023-01-02T00:00:00&startDate=2023-01-01T00:00:00"
    ]
  )

  test_endpoint(
    "search_bounced_payout_transactions/1",
    when:
      SettlementReportingAdapter.search_bounced_payout_transactions(
        %SearchPayoutBouncedTransactionsRequest{
          start_date: NaiveDateTime.new!(2023, 1, 1, 0, 0, 0),
          end_date: NaiveDateTime.new!(2023, 1, 2, 0, 0, 0)
        }
      ),
    expect: [
      get:
        "/settlement-reporting/v1/settlement-file/bounced-sub-merchant-rows?endDate=2023-01-02T00:00:00&startDate=2023-01-01T00:00:00"
    ]
  )

  test_endpoint(
    "retrieve_payout_details/1",
    when: SettlementReportingAdapter.retrieve_payout_details(42),
    expect: [
      get: "/settlement-reporting/v1/settlement-file/payout-details/42"
    ]
  )

  test_endpoint(
    "search_payout_rows/1",
    when:
      SettlementReportingAdapter.search_payout_rows(%SearchPayoutRowsRequest{
        file_status: FileStatus.approved()
      }),
    expect: [
      get: "/settlement-reporting/v1/settlement-file/settlement-file-rows?fileStatus=APPROVED"
    ]
  )
end
