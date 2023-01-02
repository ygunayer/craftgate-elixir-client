defmodule Craftgate.Model.LoyaltyType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.LoyaltyType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/LoyaltyType.java)
  """

  use Craftgate.Enum, [
    :POSTPONING_INSTALLMENT,
    :REWARD_MONEY,
    :ADDITIONAL_INSTALLMENT,
    :POSTPONING_STATEMENT,
    :EXTRA_POINTS,
    :GAINING_MINUTES
  ]
end
