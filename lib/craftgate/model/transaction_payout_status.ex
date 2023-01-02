defmodule Craftgate.Model.TransactionPayoutStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.TransactionPayoutStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/TransactionPayoutStatus.java)
  """

  use Craftgate.Enum, [
    :WAITING_FOR_PAYOUT,
    :CANCELLED,
    :NO_PAYOUT,
    :PAYOUT_COMPLETED,
    :PAYOUT_STARTED
  ]
end
