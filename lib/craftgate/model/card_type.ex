defmodule Craftgate.Model.CardType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.CardType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/CardType.java)
  """

  use Craftgate.Enum, [
    :DEBIT_CARD,
    :PREPAID_CARD,
    :CREDIT_CARD
  ]
end
