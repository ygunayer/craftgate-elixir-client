defmodule Craftgate.Request.SearchPayoutRowsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPayoutRowsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPayoutRowsRequest.java)
  """

  use Craftgate.Serializable, [
    page: :integer,
    size: :integer,
    file_status: Craftgate.Model.FileStatus,
    start_date: :naive_datetime,
    end_date: :naive_datetime
  ]
end
