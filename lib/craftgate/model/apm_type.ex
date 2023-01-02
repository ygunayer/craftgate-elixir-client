defmodule Craftgate.Model.ApmType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.ApmType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/ApmType.java)
  """

  use Craftgate.Enum, [
    :EDENRED,
    :FUND_TRANSFER,
    :PAYPAL,
    :AFTERPAY,
    :PAYONEER,
    :PAPARA,
    :EDENRED_GIFT,
    :KLARNA,
    :CASH_ON_DELIVERY,
    :SODEXO
  ]
end
