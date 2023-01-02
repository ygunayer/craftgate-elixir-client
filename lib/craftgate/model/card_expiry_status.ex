defmodule Craftgate.Model.CardExpiryStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.CardExpiryStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/CardExpiryStatus.java)
  """

  use Craftgate.Enum, [
    :EXPIRED,
    :NOT_EXPIRED,
    :WILL_EXPIRE_NEXT_MONTH
  ]
end
