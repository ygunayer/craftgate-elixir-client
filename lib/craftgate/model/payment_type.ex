defmodule Craftgate.Model.PaymentType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentType.java)
  """

  use Craftgate.Enum, [
    :DEPOSIT_PAYMENT,
    :CARD_PAYMENT,
    :WALLET_PAYMENT,
    :CARD_AND_WALLET_PAYMENT,
    :APM
  ]
end
