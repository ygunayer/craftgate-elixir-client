defmodule Craftgate.Model.WalletTransactionRefundCardTransactionType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.WalletTransactionRefundCardTransactionType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/WalletTransactionRefundCardTransactionType.java)
  """

  use Craftgate.Enum, [
    :PAYMENT_TX,
    :PAYMENT,
    :WALLET_TX
  ]
end
