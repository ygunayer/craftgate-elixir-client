defmodule CraftgateTest.Adapter.FraudAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Adapter.FraudAdapter
  alias Craftgate.Model.FraudCheckStatus
  alias Craftgate.Request.FraudValueListRequest
  alias Craftgate.Request.SearchFraudChecksRequest
  alias Craftgate.Request.UpdateFraudCheckRequest

  describe "Craftgate.Adapter.FraudAdapter" do
    test_endpoint(
      "search_fraud_checks/1",
      when:
        FraudAdapter.search_fraud_checks(%SearchFraudChecksRequest{
          page: 1,
          size: 15,
          check_status: FraudCheckStatus.fraud()
        }),
      expect: [
        get: "/fraud/v1/fraud-checks?checkStatus=FRAUD&page=1&size=15"
      ]
    )

    test_endpoint(
      "update_fraud_check_status/2",
      when: FraudAdapter.update_fraud_checks(10, FraudCheckStatus.not_fraud()),
      expect: [
        put: "/fraud/v1/fraud-checks/10/check-status",
        body: @fixture_request_update_fraud_check_status
      ]
    )

    test_endpoint(
      "retrieve_all_value_lists/0",
      when: FraudAdapter.retrieve_all_value_lists(),
      expect: [
        get: "/fraud/v1/value-lists/all"
      ]
    )

    test_endpoint(
      "retrieve_value_list/1",
      when: FraudAdapter.retrieve_value_list("foo"),
      expect: [
        get: "/fraud/v1/value-lists/foo"
      ]
    )

    test_endpoint(
      "create_value_list/1",
      expect: [
        post: "/fraud/v1/value-lists",
        body: @fixture_request_create_value_list
      ],
      when: FraudAdapter.create_value_list("foo")
    )

    test_endpoint(
      "delete_value_list/1",
      expect: [
        delete: "/fraud/v1/value-lists/foo"
      ],
      when: FraudAdapter.delete_value_list("foo")
    )

    test_endpoint(
      "add_value_to_value_list/3",
      when: FraudAdapter.add_value_to_value_list("foo", "bar", 100),
      expect: [
        post: "/fraud/v1/value-lists",
        body: @fixture_request_add_value_to_value_list
      ]
    )

    test_endpoint(
      "remove_value_from_value_list/2",
      when: FraudAdapter.remove_value_from_value_list("foo", "bar"),
      expect: [
        delete: "/fraud/v1/value-lists/foo/values/bar"
      ]
    )
  end
end
