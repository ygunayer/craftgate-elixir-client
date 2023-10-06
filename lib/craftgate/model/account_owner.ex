defmodule Craftgate.Model.AccountOwner do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.AccountOwner](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/AccountOwner.java)
  """

  use Craftgate.Enum, [
    :SUB_MERCHANT_MEMBER,
    :MERCHANT
  ]
end
