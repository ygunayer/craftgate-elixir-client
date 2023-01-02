defmodule Craftgate.Request.SearchPayoutCompletedTransactionsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPayoutCompletedTransactionsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPayoutCompletedTransactionsRequest.java)
  """

  use Craftgate.Serializable, [
    settlement_file_id: :integer,
    settlement_type: Craftgate.Model.SettlementType,
    end_date: :naive_datetime,
    start_date: :naive_datetime
  ]
end
