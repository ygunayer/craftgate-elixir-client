defmodule Craftgate.Model.RemittanceReasonType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.RemittanceReasonType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/RemittanceReasonType.java)
  """

  use Craftgate.Enum, [
    :REDEEM_ONLY_LOYALTY,
    :SUBMERCHANT_SEND_RECEIVE
  ]
end
