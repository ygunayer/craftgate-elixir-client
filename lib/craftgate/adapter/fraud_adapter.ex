defmodule Craftgate.Adapter.FraudAdapter do
  @moduledoc """
  Provides capabilities to retrieve potentially fraudulent transactions and marking them as safe, or managing fraud values for the fraud rules
  """

  use Craftgate.Adapter

  alias Craftgate.Model.FraudCheckStatus
  alias Craftgate.Request.FraudValueListRequest
  alias Craftgate.Request.SearchFraudChecksRequest
  alias Craftgate.Request.UpdateFraudCheckRequest
  alias Craftgate.Response.FraudAllValueListsResponse
  alias Craftgate.Response.FraudCheckListResponse
  alias Craftgate.Response.FraudValueListResponse

  @doc """
  Search for fraud checks that were generated for potentially fraudulent payments
  """
  endpoint search_fraud_checks(params: SearchFraudChecksRequest.t()), get: "/fraud/v1/fraud-checks", return: FraudCheckListResponse.t()

  @doc """
  Mark fraud checks as fraud or not fraud
  """
  endpoint update_fraud_checks(id: integer(), status: FraudCheckStatus.t()),
    put: "/fraud/v1/fraud-checks/:id/check-status",
    body: fn _, status -> %UpdateFraudCheckRequest{check_status: status} end

  @doc """
  Retrieve all fraud value lists
  """
  endpoint retrieve_all_value_lists(), get: "/fraud/v1/value-lists/all", return: FraudAllValueListsResponse.t()

  @doc """
  Retrieve the fraud list specified by `list_name`
  """
  endpoint retrieve_value_list(list_name: binary()), get: "/fraud/v1/value-lists/:list_name", return: FraudValueListResponse.t()

  @spec create_value_list(binary()) :: {:ok, nil} | {:error, any()}
  def create_value_list(list_name), do: add_value_to_value_list(list_name, nil, nil)

  @spec create_value_list!(binary()) :: nil | no_return()
  def create_value_list!(list_name), do: create_value_list(list_name) |> Craftgate.Utils.bangify!()

  endpoint delete_value_list(list_name: binary()), delete: "/fraud/v1/value-lists/:list_name"

  endpoint add_value_to_value_list(list_name: binary(), value: binary() | nil, expire_in_seconds: integer() | nil),
    post: "/fraud/v1/value-lists",
    body: fn list_name, value, expire_in_seconds -> %FraudValueListRequest{list_name: list_name, value: value, duration_in_seconds: expire_in_seconds} end

  endpoint remove_value_from_value_list(list_name: binary(), value: binary()),
    delete: "/fraud/v1/value-lists/:list_name/values/:value"
end
