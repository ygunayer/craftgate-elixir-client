defmodule Craftgate.Utils do
  @doc """
  Returns whether or not a given value is nil or empty
  """
  @spec is_empty?(any) :: boolean
  def is_empty?(nil), do: true
  def is_empty?(s) when is_binary(s), do: s |> String.trim() |> :string.is_empty()
  def is_empty?(x), do: x |> Enum.empty?()

  @doc """
  Returns whether or not a given value is not nil and not empty
  """
  @spec non_empty?(any) :: boolean
  def non_empty?(x), do: !is_empty?(x)

  @doc """
  Generates a random string of given length (default: 16)
  """
  @spec random_str(integer | nil) :: binary
  def random_str(length \\ 16),
    do: :crypto.strong_rand_bytes(length) |> Base.encode64() |> binary_part(0, length)

  @doc """
  Calculates the signature header based on the given parameters
  """
  @spec calculate_signature(binary(), binary(), binary(), binary(), term() | nil) :: binary()
  def calculate_signature(api_key, secret_key, url, random_key, body \\ nil) do
    hash_str =
      [url, api_key, secret_key, random_key, body]
      |> Enum.filter(&non_empty?/1)
      |> Enum.join()

    :crypto.hash(:sha256, hash_str)
    |> Base.encode64()
  end

  def bangify!({:ok, value}), do: value
  def bangify!({:error, error}), do: raise error
  def bangify!(other), do: other
end
