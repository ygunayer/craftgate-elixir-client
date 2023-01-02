defmodule Craftgate.Request.RetrieveDailyTransactionReportRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.RetrieveDailyTransactionReportRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/RetrieveDailyTransactionReportRequest.java)
  """

  use Craftgate.Serializable, [
    report_date: :date,
    file_type: Craftgate.Model.ReportFileType
  ]
end
