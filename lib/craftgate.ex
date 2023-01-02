defmodule Craftgate do
  @version Mix.Project.config()[:version]

  @moduledoc """
  Elixir client for Craftgate, the one-stop shop payment gateway
  """

  @doc """
  Returns the current project version
  """
  @spec version() :: binary()
  def version(), do: @version

  @doc """
  Returns the current client version
  """
  @spec client_version() :: binary()
  def client_version(), do: "craftgate-elixir-client:" <> version()


  @doc """
  Convenience method to access `Craftgate.Adapter.FileReportingAdapter`
  """
  @spec file_reporting() :: Craftgate.Adapter.FileReportingAdapter
  def file_reporting(), do: Craftgate.Adapter.FileReportingAdapter


  @doc """
  Convenience method to access `Craftgate.Adapter.FraudAdapter`
  """
  @spec fraud() :: Craftgate.Adapter.FraudAdapter
  def fraud(), do: Craftgate.Adapter.FraudAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.HookAdapter`
  """
  @spec hook() :: Craftgate.Adapter.HookAdapter
  def hook(), do: Craftgate.Adapter.HookAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.InstallmentAdapter`
  """
  @spec installment() :: Craftgate.Adapter.InstallmentAdapter
  def installment(), do: Craftgate.Adapter.InstallmentAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.OnboardingAdapter`
  """
  @spec onboarding() :: Craftgate.Adapter.OnboardingAdapter
  def onboarding(), do: Craftgate.Adapter.OnboardingAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.PayByLinkAdapter`
  """
  @spec pay_by_link() :: Craftgate.Adapter.PayByLinkAdapter
  def pay_by_link(), do: Craftgate.Adapter.PayByLinkAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.PaymentAdapter`
  """
  @spec payment() :: Craftgate.Adapter.PaymentAdapter
  def payment(), do: Craftgate.Adapter.PaymentAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.PaymentReportingAdapter`
  """
  @spec payment_reporting() :: Craftgate.Adapter.PaymentReportingAdapter
  def payment_reporting(), do: Craftgate.Adapter.PaymentReportingAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.SettlementReportingAdapter`
  """
  @spec settlement_reporting() :: Craftgate.Adapter.SettlementReportingAdapter
  def settlement_reporting(), do: Craftgate.Adapter.SettlementReportingAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.SettlementAdapter`
  """
  @spec settlement() :: Craftgate.Adapter.SettlementAdapter
  def settlement(), do: Craftgate.Adapter.SettlementAdapter

  @doc """
  Convenience method to access `Craftgate.Adapter.WalletAdapter`
  """
  @spec wallet() :: Craftgate.Adapter.WalletAdapter
  def wallet(), do: Craftgate.Adapter.WalletAdapter
end
