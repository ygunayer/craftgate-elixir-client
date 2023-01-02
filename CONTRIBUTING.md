# Contributing to Craftgate Elixir Client
As an open-source project, anyone can contribute to the development of `craftgate-elixir-client`. If you decide to do so, please be aware of the guidelines outlined below.

## Elixir Conventinos
We follow the general conventions in Elixir, so please make sure to apply them to your code when contributing.

### Naming Modules and Fields
All module names must be in `PascalCase`, and all fields and filenames must be in `snake_case`.

Though the Craftgate API uses `camelCase` fields, we automatically convert between `camelCase` and `snake_case` when consuming/producing JSON data, so you don't have to worry about any casing mismatch between the API and the Elixir code.

### Folder Structure and Module Files
All modules must be under the root `Craftgate` module, and placed into the appropriate folder based on the full module name.

For instance, the `Craftgate.Adapter` module should be placed at [lib/craftgate/adapter.ex](./lib/craftgate/adapter.ex), whereas the `Craftgate.Adapter.PaymentAdapter` module should be placed at [lib/craftgate/adapter/payment_adapter.ex](./lib/craftgate/adapter/payment_adapter.ex)

### Typespecs and Dialyzer
Though Elixir is a dynamically typed language, it's important to be able to provide as much typing information as possible to the users so that we don't run into type mismatch issues on the runtime.

For this we rely on Dialyzer to run type checks on compile time, and to make sure Dialyzer can run properly, we should document our type specs using the `@type` and `@spec` blocks.

For instance, a custom struct `Foo` must be documented such as follows:

```elixir
defmodule Foo do
  defstruct [:bar]

  @type bar :: binary()
  @type t :: %__MODULE__{bar: bar()}

  @spec get_bar(%__MODULE__.t()) :: bar()
  def get_bar(%Foo{bar: bar}), do: bar
end
```

Though the continuous integration runs Dialyzer on its own, you can also run it locally to double check everything before pushing your code:

```bash
mix dialyzer
```

### Documenting Code
We use [ExDoc](https://github.com/elixir-lang/ex_doc) to generate the documentation and publish it on HexDocs at [https://hexdocs.pm/craftgate](https://hexdocs.pm/craftgate).

Make sure to add `@moduledoc` blocks to your modules and `@doc` blocks to your functions and endpoint declarations to provide information about the modules and functions to the users.

You can run ExDoc locally to make sure everything looks good before pushing your code.

```bash
mix docs
```

This will generate both the HTML and ePUB versions of the documentations, which you can view by running `open docs/index.html` or `open docs/Craftgate.epub` respectively.

If you wish to automatically open both documentations once they're generated, you can also run

```bash
mix docs --open
```

## Using Macros to Avoid Redundant Code
To match the developer experience in other versions of Craftgate clients, we represent each request and response objects (as well as the DTOs under them) as Elixir structs. Likewise, we represent enumerations using enum-like modules.

Creating structs in Elixir and typing out all enumerations are both tedious and error-prone, so we use the `Craftgate.Serializable` and `Craftgate.Enum` modules to generate the corresponding code easily.

For instance, to create an enumeration of all the currencies in Craftgate, we can create a new module called `Craftgate.Model.Currency` as follows:

```elixir
defmodule Craftgate.Model.Currency do
  use Craftgate.Enum, [
    :AED,
    :ARS,
    :EUR,
    :GBP,
    :USD,
    :TRY,
    :BRL,
    :IQD,
    :CNY
  ]
end
```

Next, to create a new struct to represent requests to create wallets we can create a new module called `Craftgate.Request.CreateWalletRequest` as follows:

```elixir
defmodule Craftgate.Request.CreateWalletRequest do
  use Craftgate.Serializable, [
    negative_amount_limit: :decimal,
    currency: Craftgate.Model.Currency
  ]
end
```

Notice how we can refer to models and other request/response DTOs by simply specifying their types. Notice also that hese are not regular Elixir typespecs, but instead atoms and module references.

This is because in the background, we use [Construct](https://hex.pm/packages/construct) to type out our structs, and Construct expects types to be specified in this manner. For more information please see [Construct's documentation at hexdocs.pm](https://hexdocs.pm/construct/readme.html)

---

We might also encounter code redundancy when declaring functions to access the endpoints on Craftgate API, so for these we can use the `Craftgate.Adapter` module and its `Craftgate.Adapter.endpoint/2` macro to declare our endpoints.

For instance, to integrate with Craftgate's onboarding API we can create a module called `Craftgate.Adapter.OnboardingAdapter` as follows:

```elixir
defmodule Craftgate.Adapter.OnboardingAdapter do
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
```

For more information, please see the documentation for the `Craftgate.Adapter.endpoint/2` macro.

## Automatically Generating Models and Request/Response DTOs
To synchronize with the latest changes in Craftgate API we can automatically generate our enumerations and request/response DTOs from [craftgate/craftgate-java-client](https://github.com/craftgate/craftgate-java-client/).

For this we can use [ygunayer/craftgate-java2elixir](https://github.com/ygunayer/craftgate-java2elixir) to automatically generate the corresponding Elixir code from a specific version of `craftgate-java-client`.

Note that this project does not auto-generate functions to access any endpoints, so they must be written manually.

## Writing Tests
In addition to regular unit tests to ensure the functionality of structs and utilities, it's also important to write tests to make sure that we're calling the correct endpoints on Craftgate API with the correct payloads.

To do this, you can either take [craftgate/craftgate-java-client](https://github.com/craftgate/craftgate-java-client) or [Craftgate's developer documentation](https://developer.craftgate.io/) as reference, and write endpoint tests for your adapters under `test/craftgate_test/adapter`.

When writing endpoint tests themselves you can make use of the `test_endpoint/2` macro in the `CraftgateTest.Support.TestAdapter` module to speed up your testing process. See [test/craftgate_test/adapter/fraud_adapter_test.exs](./test/craftgate_test/adapter/fraud_adapter_test.exs) for an example implementation.
