defmodule CraftgateTest.Support.Modules.FooResponse do
  use Craftgate.Serializable,
    id: :integer,
    name: :string,
    bar: CraftgateTest.Support.Modules.BarResponse
end
