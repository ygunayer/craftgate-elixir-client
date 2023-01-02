defmodule Craftgate.Model.MemberType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.MemberType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/MemberType.java)
  """

  use Craftgate.Enum, [
    :PERSONAL,
    :PRIVATE_COMPANY,
    :LIMITED_OR_JOINT_STOCK_COMPANY
  ]
end
