defmodule Craftgate.Adapter.InstallmentAdapter do
  @moduledoc """
  Provides capabilities to retrieve information about BIN numbers and per-installment prices based on installment count
  """

  use Craftgate.Adapter

  alias Craftgate.Request.SearchInstallmentsRequest
  alias Craftgate.Response.BinNumberResponse
  alias Craftgate.Response.InstallmentListResponse

  endpoint search_installments(params: SearchInstallmentsRequest.t()), get: "/installment/v1/installments", return: InstallmentListResponse.t()

  endpoint retrieve_bin_number(bin_number: binary()), get: "/installment/v1/bins/:bin_number", return: BinNumberResponse.t()
end
