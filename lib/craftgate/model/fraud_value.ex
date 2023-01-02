defmodule Craftgate.Model.FraudValue do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.model.FraudValue](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/FraudValue.java)
  """

  use Craftgate.Serializable, [
    value: :string,
    expire_in_seconds: :integer
  ]
end
