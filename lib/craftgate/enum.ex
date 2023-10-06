defmodule Craftgate.Enum do
  @moduledoc """
  Allows modules to declare enumerations of certain values, with serialization/deserialization support.

  To do this, simply `use` this module and list the individual values as a list of atoms, e.g.

  ```elixir
  defmodule MyEnum do
    use Craftgate.Enum, [
      :FOO,
      :BAR
    ]
  end
  ```

  With this, the `MyEnum` module will gain access to the following convenience methods which can be useful
  to compare incoming values with.

  ```elixir
  ...
  def foo(), do: :FOO
  def bar(), do: :BAR

  def values(), do: [:FOO, :BAR]
  ...
  ```

  The module will also adopt the `Construct.TypeC` behavior which will allow it to cast back and forth between
  values and their string representations. For more info, see `Construct.TypeC`

  ```elixir
  MyEnum.cast("FOO") # returns :FOO
  MyEnum.cast(:FOO) # returns :FOO
  ```

  Please also note that strings or atoms that are not in the actual enumaration list will still be accepted
  so as not to regressions when a remote data source decides to add more values to the list.

  When this occurs, an error message will be logged into the console with the `warn` level to let the developers
  know that a version bump might be necessary.

  ```elixir
  MyEnum.cast("BAZ") # returns :BAZ but also logs the following message:
  # An unknown enum value was received but accepted for backwards compatibility: BAZ. Known values are: BAR, BAZ
  ```
  """

  defmacro __using__(values) do
    function_defs =
      values
      |> Enum.map(fn value ->
        name = value |> Atom.to_string() |> Macro.underscore() |> String.to_atom()
        {name, value}
      end)

    typespec = quote(do: values |> Enum.map(&inspect/1) |> Enum.join(" | ") |> Code.string_to_quoted!())

    quote bind_quoted: [values: values, function_defs: function_defs, typespec: typespec] do
      @type t :: unquote(typespec)

      for {name, value} <- function_defs do
        def unquote(name)(), do: unquote(value)
      end

      def values(), do: unquote(values)

      def cast(value), do: Craftgate.Enum.castc(value, values())
    end
  end

  @behaviour Construct.TypeC

  require Logger

  def castc(value, variants) when is_atom(value) do
    unless value in variants do
      Logger.warning(
        "An unknown enum value was received but accepted for backwards compatibility: #{value}. Known values are: #{inspect(variants)}"
      )
    end

    {:ok, value}
  end

  def castc(value, variants) when is_binary(value),
    do: castc(String.to_atom(value), variants)
end
