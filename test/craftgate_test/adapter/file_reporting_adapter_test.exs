defmodule CraftgateTest.Adapter.FileReportingAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Model.ReportFileType
  alias Craftgate.Request.RetrieveDailyTransactionReportRequest

  describe "Craftgate.Adapter.FileReportingAdapter" do
    test "retrieve_daily_transaction_report/1 should send GET request to /file-reporting/v1/transaction-reports" do
      MockHTTPoison
      |> expect(:request, fn method, url, _body, headers, _opts ->
        assert :get == method

        assert String.ends_with?(
                 url,
                 "/file-reporting/v1/transaction-reports?fileType=CSV&reportDate=2023-05-26"
               )

        assert "application/octet-stream" == headers[:"content-type"]
        {:ok, <<42, 42>>}
      end)

      assert {:ok, [42, 42]} ==
               Craftgate.Adapter.FileReportingAdapter.retrieve_daily_transaction_report(
                 %RetrieveDailyTransactionReportRequest{
                   file_type: ReportFileType.csv(),
                   report_date: Date.new!(2023, 05, 26)
                 }
               )
    end

    test "retrieve_daily_transaction_report!/1 should send GET request to /file-reporting/v1/transaction-reports" do
      MockHTTPoison
      |> expect(:request, fn method, url, _body, headers, _opts ->
        assert :get == method

        assert String.ends_with?(
                 url,
                 "/file-reporting/v1/transaction-reports?fileType=XLSX&reportDate=2023-05-25"
               )

        assert "application/octet-stream" == headers[:"content-type"]
        {:ok, <<42, 42>>}
      end)

      assert [42, 42] ==
               Craftgate.Adapter.FileReportingAdapter.retrieve_daily_transaction_report!(
                 %RetrieveDailyTransactionReportRequest{
                   file_type: ReportFileType.xlsx(),
                   report_date: Date.new!(2023, 05, 25)
                 }
               )
    end
  end
end
