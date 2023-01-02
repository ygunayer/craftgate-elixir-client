defmodule Craftgate.Model.TransactionStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.TransactionStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/TransactionStatus.java)
  """

  use Craftgate.Enum, [
    :WAITING_FOR_APPROVAL,
    :APPROVED,
    :PAYOUT_STARTED
  ]
end
