defmodule Craftgate.Response.Dto.InstallmentPrice do
  @moduledoc """
  Elixir equivalent of the Java data class [io.craftgate.response.dto.InstallmentPrice](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/response/dto/InstallmentPrice.java)
  """

  use Craftgate.Serializable, [
    pos_alias: :string,
    installment_number: :integer,
    installment_price: :decimal,
    bank_commission_rate: :decimal,
    merchant_commission_rate: :decimal,
    total_price: :decimal,
    installment_label: :string,
    loyalty_supported: :boolean
  ]
end
