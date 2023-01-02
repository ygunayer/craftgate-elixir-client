[![Hex pm](https://img.shields.io/hexpm/v/craftgate.svg?style=flat)](https://hex.pm/packages/craftgate)

# Craftgate
This repo contains the Elixir client for Craftgate API.

## Requirements
- Elixir `1.12` or newer

## Dependencies
- [HTTPoison](https://github.com/edgurgel/httpoison/) to execute requests
- [Jason](https://github.com/michalmuskala/jason) for JSON serialization/deserialization
- [Construct](https://github.com/ExpressApp/construct) to provide a concise interface for representing request/response payloads as Elixir structs while also having them converted automatically by Jason
- [Decimal](https://github.com/ericmj/decimal) to represent monetary values
- [Recase](https://github.com/wemake-services/recase) to convert between Craftgate API's `camelCase` and Elixir's `snake_case`

> **Note:** To keep the correct precision without losing any information, all decimals are serialized into *strings*. Since Craftgate API uses Java's `BigDecimal` to process these values it has no trouble parsing them, and likewise, by using Construct, Jason and Decimal in conjunction we're able to parse both numerical and string representations of decimals.

## Installation
Add the `:craftgate` dependency to your `mix.exs` file

```elixir
def deps do
  ...
  {:craftgate, "~> 1.0.40"}
  ...
end
```

## Configuration
To access the Craftgate API you'll first need to obtain a set of API credentials. If you don't already have a Craftgate account, you can signup at [https://craftgate.io](https://craftgate.io), and after the onboarding process you will be able to access your API credentials from the merchant panel.

Once you've obtained your API credentials, you can configure Craftgate through the `:craftgate` on your `config.exs` file.

```elixir
config :craftgate,
  api_key: "<YOUR API KEY>",
  secret_key: "<YOUR SECRET KEY>"
```

By default, Craftgate will run in sandbox mode and connect to the sandbox API at [https://sandbox-api.craftgate.io](https://sandbox-api.craftgate.io).

Once you're confident with your implementation you can swap out the `base_url` parameter with the live production URL at [https://api.craftgate.io](https://api.craftgate.io)

```elixir
config :craftgate,
  api_key: "<YOUR API KEY>",
  secret_key: "<YOUR SECRET KEY>",
  base_url: "https://api.craftgate.io"
```

Additionally, Craftgate will use English as the default locale (`"en"`) when contacting the Craftgate API, and also set a few request options to disable redirections and set particular request and receive timeouts. You can override these configurations by changing the `lang` and `request_options` keys respectively.

Do note, however, that by overriding `request_options`, you will be losing the default request options, so don't forget to include them if you only wish to add more parameters. For a list of all available options, see [the documentation for HTTPoison.Request](https://hexdocs.pm/httpoison/HTTPoison.Request.html)

Below is the list of default request options:

```elixir
[
  timeout: 10_000,
  recv_timeout: 150_000,
  max_redirect: 0,
  follow_redirect: false
]
```

> **Note:** You can also override these values by passing them to any Craftgate API call (e.g. `Craftgate.Adapter.PaymentReportingAdapter.retrieve_payment(1, request_options: [timeout: 100_000]`)

So with that, a fully customized Craftgate configuration can look something like below:

```elixir
config :craftgate,
  api_key: "<YOUR API KEY>",
  secret_key: "<YOUR SECRET KEY>",
  base_url: "https://api.craftgate.io",
  lang: "tr",
  request_options: [
    timeout: 60_000,
    recv_timeout: 120_000,
    max_redirect: 1,
    follow_redirect: true
  ]
```

### Environment-Specific Configuration
As with any Phoenix app you can also make use of the environment-specific files to configure Craftgate for your development and production environments. In fact, we highly recommend inferring the production API credentials from environment variables in production and not have them written out plainly in your codebase.

**config/config.exs**
```elixir
...
config :craftgate,
  base_url: "https://sandbox-api.craftgate.io",
  api_key: "<YOUR SANDBOX API KEY>",
  secret_key: "<YOUR SANDBOX SECRET KEY>"
...
```

**config/prod.exs**
```elixir
...
config :craftgate,
  base_url: "https://api.craftgate.io",
  api_key: System.get_env("CRAFTGATE__API_KEY"),
  secret_key: System.get_env("CRAFTGATE__SECRET_KEY")"
...
```

### Non-Phoenix Apps or Manual Configuration
If you're not using Phoenix, or if you can't/don't want to use the `Config` module you can also configure Craftgate by injecting the same properties into the `:craftgate` key using `Application.put_env/3`

```elixir
Application.put_env(:craftgate, :api_key, "<YOUR API KEY>")
Application.put_env(:craftgate, :secret_key, "<YOUR SECRET KEY>")
Application.put_env(:craftgate, :base_url, "https://sandbox-api.craftgate.io")
```

## Usage
The Craftgate Elixir client is stateless, so unlike its counterparts in other programming languages, you do not have to instantiate any Craftgate client. Instead, you can access specificy adapters directly, either through the adapter module itself, or through the convenience accessors on the `Craftgate` module itself.

Below is a list of all the adapters that are available:

| Module | Accessor | Responsibilities |
|--------|----------|------------------|
| `Craftgate.Adapter.FileReportingAdapter` | `Craftgate.file_reporting/0` | File-based reporting activities like obtaining daily transaction reports |
| `Craftgate.Adapter.FraudAdapter` | `Craftgate.fraud/0` | Fraud operations like retrieving potentially fraudulent transactions, marking them as safe, managing fraud values |
| `Craftgate.Adapter.HookAdapter` | `Craftgate.hook/0` | Hook-related utility functions like verifying incoming webhooks |
| `Craftgate.Adapter.InstallmentAdapter` | `Craftgate.installment/0` | Retrieving per-installment pricing information based on installment count or BIN number |
| `Craftgate.Adapter.OnboardingAdapter` | `Craftgate.onboarding/0` | Conducting CRUD operations on buyers and submerchants |
| `Craftgate.Adapter.PayByLinkAdapter` | `Craftgate.pay_by_link/0` | Managing and listing products available for the pay-by-link feature |
| `Craftgate.Adapter.PaymentAdapter` | `Craftgate.payment/0` | Conducting payments, managing stored cards |
| `Craftgate.Adapter.PaymentReportingAdapter` | `Craftgate.payment_reporting/0` | Searching payments, retrieving payment details, retrieving payment transaction records |
| `Craftgate.Adapter.SettlementReportingAdapter` | `Craftgate.settlement_reporting/0` | Settlement operations like search payout completed transactions, search bounced payout transactions |
| `Craftgate.Adapter.SettlementAdapter` | `Craftgate.settlement/0` | Settlement operations like create instant wallet settlement |
| `Craftgate.Adapter.WalletAdapter` | `Craftgate.wallet/0` | Wallet operations like sending and receiving remittance, searching walletes and wallet transactions of members |

Once Craftgate is configured, you can use one of these adapters to interact with Craftgate API.

```elixir
defmodule Orders do
  def refund_order(order_id) do
    with {:ok, order} <- Order.get(order_id),
         {:ok, refund_result} <- Craftgate.Adapter.PaymentAdapter.refund_payment(%Craftgate.Request.RefundPaymentRequest{
            payment_id: order.craftgate_payment_id,
            refund_destination_type: Craftgate.Model.RefundDestinationType.card(),
         }),
         ...
    do
      ...
    else
      ...
    end
  end
end
```

## Running Samples
This project has a set of samples that you can run to interact with the Craftgate API, located at [lib/mix/tasks/sample](https://github.com/ygunayer/craftgate-elixir/tree/main/lib/mix/tasks/sample/).

These samples are constructed as Mix tasks so you can even run them after adding `craftgate-elixir` as a dependency to your project.

```bash
$ mix sample.payment.create
[lib/mix/tasks/sample/payment/create.ex:45: Mix.Tasks.Sample.Payment.Create.run/1]
result #=> %Craftgate.Response.PaymentResponse{
...
}
```

Note that by default these samples use the public API keypairs found at [https://developer.craftgate.io](https://developer.craftgate.io) and target the sandbox environment of Craftgate API at [https://sandbox-api.craftgate.io](https://sandbox-api.craftgate.io), but they will also try to use any existing configuration you might have. As such, if you run these samples from your own project with Craftgate already configured, you will be access the Craftgate API with your own credentials.

In addition to the Mix tasks, you can also jump into a Mix-enabled interactive Elixir session, put your credentials into the `:api_key` and `:secret_key` keys of the `:craftgate` configuration and run any adapter method.

```bash
$ iex -S mix

iex(1)> Application.put_env(:craftgate, :api_key, "<YOUR API KEY>")
:ok
iex(2)> Application.put_env(:craftgate, :secret_key, "<YOUR SECRET KEY>")
:ok
iex(3)> Application.put_env(:craftgate, :base_url, "https://sandbox-api.craftgate.io")
:ok
iex(4)> Craftgate.Adapter.PaymentReportingAdapter.retrieve_payment(1)
{:ok,
 %Craftgate.Response.ReportingPaymentResponse{
   retry_count: 0,
   refundable_price: Decimal.new("100.0"),
   refund_status: :NOT_REFUNDED,
   ...
 }
}
```

## Contributing
For instructions on how to contribute to the project please see [CONTRIBUTING.md](./CONTRIBUTING.md)

## License
MIT
