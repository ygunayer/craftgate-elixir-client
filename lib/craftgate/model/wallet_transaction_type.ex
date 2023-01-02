defmodule Craftgate.Model.WalletTransactionType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.WalletTransactionType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/WalletTransactionType.java)
  """

  use Craftgate.Enum, [
    :WITHDRAW_CANCEL,
    :PAYMENT_REDEEM,
    :CANCEL_REFUND_TO_WALLET,
    :DEPOSIT_FROM_CARD,
    :REFUND_TX_TO_WALLET,
    :DEPOSIT_FROM_FUND_TRANSFER,
    :LOYALTY,
    :MANUAL_REFUND_TX_TO_WALLET,
    :WITHDRAW,
    :REFUND_WALLET_TX_TO_CARD,
    :REMITTANCE,
    :REFUND_TX_DEPOSIT,
    :SETTLEMENT_EARNINGS,
    :REFUND_WALLET_TX_FUND_TRANSFER,
    :CANCEL_REFUND_WALLET_TO_CARD,
    :MERCHANT_BALANCE_RESET,
    :REFUND_DEPOSIT,
    :DEPOSIT_FROM_APM
  ]
end
