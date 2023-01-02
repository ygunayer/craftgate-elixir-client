defmodule Craftgate.Model.CardAssociation do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.CardAssociation](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/CardAssociation.java)
  """

  use Craftgate.Enum, [
    :AMEX,
    :MAESTRO,
    :DISCOVER,
    :JCB,
    :VISA,
    :UNION_PAY,
    :MASTER_CARD,
    :TROY,
    :DINERS_CLUB
  ]
end
