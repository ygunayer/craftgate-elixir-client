defmodule Craftgate.Model.Loyalty do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.model.Loyalty](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/Loyalty.java)
  """

  use Craftgate.Serializable, [
    type: Craftgate.Model.LoyaltyType,
    reward: Craftgate.Model.Reward,
    message: :string
  ]
end
