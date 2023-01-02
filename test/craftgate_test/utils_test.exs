defmodule CraftgateTest.UtilsTest do
  use ExUnit.Case, async: true

  doctest Craftgate

  alias Craftgate.Utils

  describe "is_empty?/1" do
    @tag empty_cases: [nil, [], %{}, "", " ", "   "]
    test "should return true for empty values", %{empty_cases: empty_cases} do
      assert Enum.all?(empty_cases, &Utils.is_empty?/1) == true
    end

    @tag non_empty_cases: ["foo", " foo", " f ", [42], [foo: 42], %{foo: 42}, %{"foo" => 42}]
    test "should return false for non-empty values", %{non_empty_cases: non_empty_cases} do
      assert Enum.any?(non_empty_cases, &Utils.is_empty?/1) == false
    end
  end

  describe "calculate_signature/1" do
    test "should calculate signature when body is nil" do
      actual =
        Utils.calculate_signature(
          "dummy",
          "dummy",
          "123",
          "https://sandbox-api.craftgate.io"
        )

      assert "ReXSheg5jlISHEP5QzHcfdsgTlNFcz7V/rq7b7+UzRc=" == actual
    end

    test "should calculate signature when body is not nil" do
      actual =
        Utils.calculate_signature(
          "dummy",
          "dummy",
          "123",
          "https://sandbox-api.craftgate.io",
          "{\"foo\": 42}"
        )

      assert "p3oVCRv4qSgs70yTkrHn2XcF3vcsSbtwl5IwvGjMpvw=" == actual
    end
  end

  describe "bangify/1" do
    test "should return second element of OK tuple" do
      assert :foo == Utils.bangify!({:ok, :foo})
    end

    test "should raise second element if error tuple" do
      error_msg = "Some error"
      assert_raise(RuntimeError, error_msg, fn -> Utils.bangify!({:error, error_msg}) end)
    end

    test "should return input as-is if not a tuple" do
      assert :foo == Utils.bangify!(:foo)
    end
  end

  describe "random_str/1" do
    test "should return string with desired length" do
      str = Utils.random_str(5)
      assert 5 == String.length(str)
    end

    test "should always return a different string" do
      assert Utils.random_str() != Utils.random_str()
    end
  end
end
