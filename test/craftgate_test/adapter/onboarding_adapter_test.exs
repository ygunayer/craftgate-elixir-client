defmodule CraftgateTest.Adapter.OnboardingAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Request.SearchMembersRequest
  alias Craftgate.Model.SettlementEarningsDestination
  alias Craftgate.Model.MemberType
  alias Craftgate.Adapter.OnboardingAdapter
  alias Craftgate.Request.CreateMemberRequest
  alias Craftgate.Request.UpdateMemberRequest

  describe "Cratgate.Adapter.OnboardingAdapter" do
    test_endpoint(
      "create_member/1",
      when:
        OnboardingAdapter.create_member(%CreateMemberRequest{
          name: "Foo Bar",
          member_external_id: "my-user-id-1",
          address: "Foo Bar St. No 16",
          email: "foo@bar.com",
          phone_number: "+905551234567",
          identity_number: "11111111111",
          contact_name: "Foo",
          contact_surname: "Bar",
          member_type: MemberType.personal(),
          tax_office: "Kagithane",
          tax_number: "11111111111",
          iban: "TR180006219896767692848261",
          is_buyer: true,
          is_sub_merchant: false
        }),
      expect: [
        post: "/onboarding/v1/members",
        body: @fixture_request_create_member
      ]
    )

    test_endpoint(
      "update_member/1",
      when:
        OnboardingAdapter.update_member(
          42,
          %UpdateMemberRequest{
            name: "Bar Baz",
            settlement_earnings_destination: SettlementEarningsDestination.iban()
          }
        ),
      expect: [
        put: "/onboarding/v1/members/42",
        body: @fixture_request_update_member
      ]
    )

    test_endpoint(
      "retrieve_member/1",
      when: OnboardingAdapter.retrieve_member(42),
      expect: [
        get: "/onboarding/v1/members/42"
      ]
    )

    test_endpoint(
      "search_members/1",
      when:
        OnboardingAdapter.search_members(%SearchMembersRequest{
          member_ids: [23, 42]
        }),
      expect: [
        get: "/onboarding/v1/members?memberIds=23,42"
      ]
    )
  end
end
