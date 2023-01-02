defmodule CraftgateTest.Adapter.HookAdapterTest do
  use ExUnit.Case, async: true

  alias Craftgate.Model.WebhookStatus
  alias Craftgate.Model.WebhookData
  alias Craftgate.Model.WebhookEventType
  alias Craftgate.Adapter.HookAdapter

  @merchant_key "merchant-key-123456"
  @valid_signature "8FF102D062578A2B51CE5A5D51769BEC2FEF6385469CC4577E7313B886069915"
  @invalid_signature "foo"
  @webhook_data %WebhookData{
    payload_id: 2_150_001,
    event_type: WebhookEventType.api_auth(),
    status: WebhookStatus.success(),
    event_timestamp: 1_641_018_632,
    event_time: NaiveDateTime.new(2022, 01, 01, 09, 30, 32)
  }

  describe "Craftgate.Adapter.HookAdapter.is_webhook_verified/3" do
    test "should return false if key is nil" do
      assert !HookAdapter.is_webhook_verified(nil, @valid_signature, @webhook_data)
    end

    test "should return false if incoming signature is nil" do
      assert !HookAdapter.is_webhook_verified(@merchant_key, nil, @webhook_data)
    end

    test "should return false if webhook data is nil" do
      assert !HookAdapter.is_webhook_verified(@merchant_key, @valid_signature, nil)
    end

    test "should return false if invalid" do
      assert !HookAdapter.is_webhook_verified(@merchant_key, @invalid_signature, @webhook_data)
    end

    test "should return true if valid" do
      assert HookAdapter.is_webhook_verified(@merchant_key, @valid_signature, @webhook_data)
    end
  end
end
