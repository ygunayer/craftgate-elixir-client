defmodule Craftgate.Adapter.OnboardingAdapter do
  @moduledoc """
  Provides capabilities to conduct CRUD operations on buyers and submerchants
  """

  use Craftgate.Adapter

  alias Craftgate.Request.CreateMemberRequest
  alias Craftgate.Request.SearchMembersRequest
  alias Craftgate.Request.UpdateMemberRequest
  alias Craftgate.Response.MemberListResponse
  alias Craftgate.Response.MemberResponse

  endpoint create_member(body: CreateMemberRequest.t()), post: "/onboarding/v1/members", return: MemberResponse.t()

  endpoint update_member(id: integer(), body: UpdateMemberRequest.t()), put: "/onboarding/v1/members/:id", return: MemberResponse.t()

  endpoint retrieve_member(id: integer()), get: "/onboarding/v1/members/:id", return: MemberResponse.t()

  endpoint search_members(params: SearchMembersRequest.t()), get: "/onboarding/v1/members", return: MemberListResponse.t()
end
