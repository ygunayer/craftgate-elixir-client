defmodule Craftgate.Model.PaymentMethod do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentMethod](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentMethod.java)
  """

  use Craftgate.Enum, [
    :EDENRED,
    :PAYPAL,
    :STRIPE,
    :ALIPAY,
    :AFTERPAY,
    :MASTERPASS,
    :PAYONEER,
    :PAPARA,
    :EDENRED_GIFT,
    :KLARNA,
    :CARD,
    :SODEXO
  ]
end
