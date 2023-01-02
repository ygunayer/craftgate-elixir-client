defmodule Craftgate.Model.PaymentSource do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentSource](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentSource.java)
  """

  use Craftgate.Enum, [
    :CHECKOUT_FORM,
    :API,
    :PAY_BY_LINK
  ]
end
