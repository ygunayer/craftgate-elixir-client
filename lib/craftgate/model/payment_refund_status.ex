defmodule Craftgate.Model.PaymentRefundStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentRefundStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentRefundStatus.java)
  """

  use Craftgate.Enum, [
    :PARTIAL_REFUNDED,
    :FULLY_REFUNDED,
    :NOT_REFUNDED,
    :NO_REFUND
  ]
end
