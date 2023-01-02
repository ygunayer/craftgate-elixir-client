defmodule Craftgate.Model.Reward do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.model.Reward](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/Reward.java)
  """

  use Craftgate.Serializable, [
    card_reward_money: :decimal,
    firm_reward_money: :decimal,
    total_reward_money: :decimal
  ]
end
