defmodule Craftgate.Model.MerchantType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.MerchantType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/MerchantType.java)
  """

  use Craftgate.Enum, [
    :SUB_MERCHANT_MEMBER,
    :MERCHANT
  ]
end
