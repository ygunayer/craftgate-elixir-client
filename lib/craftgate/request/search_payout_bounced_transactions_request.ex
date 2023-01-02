defmodule Craftgate.Request.SearchPayoutBouncedTransactionsRequest do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.request.SearchPayoutBouncedTransactionsRequest](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/request/SearchPayoutBouncedTransactionsRequest.java)
  """

  use Craftgate.Serializable, [
    end_date: :naive_datetime,
    start_date: :naive_datetime
  ]
end
