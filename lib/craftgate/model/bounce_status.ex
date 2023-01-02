defmodule Craftgate.Model.BounceStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.BounceStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/BounceStatus.java)
  """

  use Craftgate.Enum, [
    :BOUNCED,
    :PAYOUT_COMPLETED,
    :NOT_BOUNCED,
    :UPDATED,
    :PAYOUT_STARTED
  ]
end
