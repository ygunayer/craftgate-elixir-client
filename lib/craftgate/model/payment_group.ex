defmodule Craftgate.Model.PaymentGroup do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentGroup](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentGroup.java)
  """

  use Craftgate.Enum, [
    :PRODUCT,
    :LISTING_OR_SUBSCRIPTION
  ]
end
