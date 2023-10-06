defmodule Craftgate.Model.PayoutAccountType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PayoutAccountType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PayoutAccountType.java)
  """

  use Craftgate.Enum, [
    :WISE
  ]
end
