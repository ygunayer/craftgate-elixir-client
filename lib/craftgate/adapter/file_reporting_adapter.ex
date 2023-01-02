defmodule Craftgate.Adapter.FileReportingAdapter do
  @moduledoc """
  Provides capabilities to retrieve file-based reports such as daily transaction reports
  """

  use Craftgate.Adapter

  alias Craftgate.Request.RetrieveDailyTransactionReportRequest

  @header_content_type :"content-type"

  @spec retrieve_daily_transaction_report(RetrieveDailyTransactionReportRequest.t()) :: {:ok, iolist()} | {:error, any()}
  def retrieve_daily_transaction_report(params) do

    request_data = [
      method: :get,
      url: "/file-reporting/v1/transaction-reports",
      headers: Keyword.put([], @header_content_type, "application/octet-stream"),
      params: params,
    ]

    case Craftgate.Config.get() do
      {:ok, config} ->
        request_data
        |> Craftgate.HttpClient.execute(config)
        |> Craftgate.Serializable.parse(:raw)

      {:error, error} -> {:error, error}
    end
  end

  @spec retrieve_daily_transaction_report!(RetrieveDailyTransactionReportRequest.t()) :: iolist() | no_return()
  def retrieve_daily_transaction_report!(params), do: retrieve_daily_transaction_report(params) |> Craftgate.Utils.bangify!()
end
