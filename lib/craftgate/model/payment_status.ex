defmodule Craftgate.Model.PaymentStatus do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.PaymentStatus](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/PaymentStatus.java)
  """

  use Craftgate.Enum, [
    :SUCCESS,
    :INIT_THREEDS,
    :WAITING,
    :CALLBACK_THREEDS,
    :FAILURE
  ]
end
