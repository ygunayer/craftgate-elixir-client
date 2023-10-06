defmodule Craftgate.Model.Currency do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.Currency](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/Currency.java)
  """

  use Craftgate.Enum, [
    :AED,
    :ARS,
    :EUR,
    :GBP,
    :AZN,
    :USD,
    :TRY,
    :BRL,
    :IQD,
    :CNY
  ]
end
