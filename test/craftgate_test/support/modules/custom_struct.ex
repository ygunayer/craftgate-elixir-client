defmodule CraftgateTest.Support.Modules.CustomStruct do
  defstruct [:foo_bar, :baz]
  @enforce_keys [:foo_bar]
end
