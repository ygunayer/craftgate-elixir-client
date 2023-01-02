defmodule Mix.Tasks.Sample.Payment.Create do
  @moduledoc """
  Creates a payment using the credentials at `Mix.TaskHelper.set_sample_config/0`
  """

  def run(_) do
    request = %Craftgate.Request.CreatePaymentRequest{
      price: Decimal.new("100.0"),
      paid_price: Decimal.new("100.0"),
      wallet_price: Decimal.new("0.0"),
      installment: 1,
      conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
      currency: Craftgate.Model.Currency.try(),
      payment_group: Craftgate.Model.PaymentGroup.listing_or_subscription(),
      card: %Craftgate.Request.Dto.Card{
        card_holder_name: "Haluk Demir",
        card_number: "5258640000000001",
        expire_year: "2044",
        expire_month: "07",
        cvc: "000"
      },
      items: [
        %Craftgate.Request.Dto.PaymentItem{
          name: "Item 1",
          price: Decimal.new("30.0"),
          external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
        },
        %Craftgate.Request.Dto.PaymentItem{
          name: "Item 2",
          price: Decimal.new("50.0"),
          external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
        },
        %Craftgate.Request.Dto.PaymentItem{
          name: "Item 3",
          price: Decimal.new("20.0"),
          external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
        }
      ]
    }

    Mix.TaskHelper.set_sample_config()

    {:ok, result} = Craftgate.Adapter.PaymentAdapter.create_payment(request)

    dbg(result)
  end
end
