defmodule CraftgateTest do
  use ExUnit.Case, async: true

  @mix_project_version Mix.Project.config()[:version]

  describe "Craftgate" do
    test "version/0 should return version" do
      assert @mix_project_version == Craftgate.version()
    end

    test "client_version/0 should return client version" do
      assert "craftgate-elixir-client:#{@mix_project_version}" == Craftgate.client_version()
    end

    test "should return adapters" do
      assert Craftgate.Adapter.FileReportingAdapter == Craftgate.file_reporting()
      assert Craftgate.Adapter.FraudAdapter == Craftgate.fraud()
      assert Craftgate.Adapter.HookAdapter == Craftgate.hook()
      assert Craftgate.Adapter.InstallmentAdapter == Craftgate.installment()
      assert Craftgate.Adapter.OnboardingAdapter == Craftgate.onboarding()
      assert Craftgate.Adapter.PayByLinkAdapter == Craftgate.pay_by_link()
      assert Craftgate.Adapter.PaymentAdapter == Craftgate.payment()
      assert Craftgate.Adapter.PaymentReportingAdapter == Craftgate.payment_reporting()
      assert Craftgate.Adapter.SettlementReportingAdapter == Craftgate.settlement_reporting()
      assert Craftgate.Adapter.SettlementAdapter == Craftgate.settlement()
      assert Craftgate.Adapter.WalletAdapter == Craftgate.wallet()
    end
  end
end
