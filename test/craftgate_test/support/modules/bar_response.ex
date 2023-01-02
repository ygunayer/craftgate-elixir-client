defmodule CraftgateTest.Support.Modules.BarResponse do
  use Craftgate.Serializable,
    id: :integer,
    baz: {:array, CraftgateTest.Support.Modules.BazResponse}
end
