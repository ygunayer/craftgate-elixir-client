defmodule Craftgate.Model.PaymentProvider do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentProvider](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentProvider.java)
  """

  use Craftgate.Enum, [
    :EDENRED,
    :BANK,
    :MASTERPASS,
    :GARANTI_PAY,
    :PAYONEER,
    :PAPARA,
    :CG_WALLET,
    :SODEXO
  ]
end
