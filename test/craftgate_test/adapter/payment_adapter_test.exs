defmodule CraftgateTest.Adapter.PaymentAdapterTest do
  use CraftgateTest.Support.TestAdapter

  alias Craftgate.Adapter.PaymentAdapter
  alias Craftgate.Model.ApmType
  alias Craftgate.Model.CardAssociation
  alias Craftgate.Model.CardType
  alias Craftgate.Model.Currency
  alias Craftgate.Model.PaymentGroup
  alias Craftgate.Model.PaymentProvider
  alias Craftgate.Model.RefundDestinationType
  alias Craftgate.Request.ApprovePaymentTransactionsRequest
  alias Craftgate.Request.CheckMasterpassUserRequest
  alias Craftgate.Request.CompleteApmPaymentRequest
  alias Craftgate.Request.CompletePosApmPaymentRequest
  alias Craftgate.Request.CompleteThreeDSPaymentRequest
  alias Craftgate.Request.CreateApmPaymentRequest
  alias Craftgate.Request.CreateDepositPaymentRequest
  alias Craftgate.Request.CreateFundTransferDepositPaymentRequest
  alias Craftgate.Request.CreatePaymentRequest
  alias Craftgate.Request.DeleteStoredCardRequest
  alias Craftgate.Request.DisapprovePaymentTransactionsRequest
  alias Craftgate.Request.Dto.Card
  alias Craftgate.Request.Dto.GarantiPayInstallment
  alias Craftgate.Request.Dto.PaymentItem
  alias Craftgate.Request.InitApmDepositPaymentRequest
  alias Craftgate.Request.InitApmPaymentRequest
  alias Craftgate.Request.InitCheckoutPaymentRequest
  alias Craftgate.Request.InitGarantiPayPaymentRequest
  alias Craftgate.Request.InitGarantiPayPaymentRequest
  alias Craftgate.Request.InitPosApmPaymentRequest
  alias Craftgate.Request.InitThreeDSPaymentRequest
  alias Craftgate.Request.PostAuthPaymentRequest
  alias Craftgate.Request.RefundPaymentRequest
  alias Craftgate.Request.RefundPaymentTransactionRequest
  alias Craftgate.Request.RetrieveLoyaltiesRequest
  alias Craftgate.Request.SearchStoredCardsRequest
  alias Craftgate.Request.StoreCardRequest
  alias Craftgate.Request.UpdateCardRequest
  alias Craftgate.Request.UpdatePaymentTransactionRequest

  test_endpoint(
    "create_payment/1",
    when:
      PaymentAdapter.create_payment(%CreatePaymentRequest{
        price: Decimal.new("100.0"),
        paid_price: Decimal.new("100.0"),
        wallet_price: Decimal.new("0.0"),
        installment: 1,
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        currency: Currency.try(),
        payment_group: PaymentGroup.listing_or_subscription(),
        card: %Card{
          card_holder_name: "Haluk Demir",
          card_number: "5258640000000001",
          expire_year: "2044",
          expire_month: "07",
          cvc: "000"
        },
        items: [
          %PaymentItem{
            name: "Item 1",
            price: Decimal.new("30.0"),
            external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
          },
          %PaymentItem{
            name: "Item 2",
            price: Decimal.new("50.0"),
            external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
          },
          %PaymentItem{
            name: "Item 3",
            price: Decimal.new("20.0"),
            external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
          }
        ]
      }),
    expect: [
      post: "/payment/v1/card-payments",
      body: @fixture_request_create_payment
    ]
  )

  test_endpoint(
    "init_3ds_payment/1",
    when:
      PaymentAdapter.init_3ds_payment(%InitThreeDSPaymentRequest{
        price: Decimal.new("100.0"),
        paid_price: Decimal.new("100.0"),
        wallet_price: Decimal.new("0.0"),
        installment: 1,
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        currency: Currency.try(),
        payment_group: PaymentGroup.listing_or_subscription(),
        callback_url: "https://www.your-website.com/craftgate-3DSecure-callback",
        card: %Card{
          card_holder_name: "Haluk Demir",
          card_number: "5258640000000001",
          expire_year: "2044",
          expire_month: "07",
          cvc: "000"
        },
        items: [
          %PaymentItem{
            name: "Item 1",
            price: Decimal.new("30.0"),
            external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
          },
          %PaymentItem{
            name: "Item 2",
            price: Decimal.new("50.0"),
            external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
          },
          %PaymentItem{
            name: "Item 3",
            price: Decimal.new("20.0"),
            external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
          }
        ]
      }),
    expect: [
      post: "/payment/v1/card-payments/3ds-init",
      body: @fixture_request_init_3ds_payment
    ]
  )

  test_endpoint(
    "complete_3ds_payment/1",
    when:
      PaymentAdapter.complete_3ds_payment(%CompleteThreeDSPaymentRequest{
        payment_id: 1
      }),
    expect: [
      post: "/payment/v1/card-payments/3ds-complete",
      body: @fixture_request_complete_3ds_payment
    ]
  )

  test_endpoint(
    "post_auth_payment/2",
    when:
      PaymentAdapter.post_auth_payment(42, %PostAuthPaymentRequest{
        paid_price: Decimal.new("100.0")
      }),
    expect: [
      post: "/payment/v1/card-payments/42/post-auth",
      body: @fixture_request_post_auth_payment
    ]
  )

  test_endpoint(
    "init_checkout_payment/1",
    when:
      PaymentAdapter.init_checkout_payment(%InitCheckoutPaymentRequest{
        price: Decimal.new("100.0"),
        paid_price: Decimal.new("100.0"),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        currency: Currency.try(),
        payment_group: PaymentGroup.listing_or_subscription(),
        callback_url: "https://www.your-website.com/craftgate-checkout-callback",
        items: [
          %PaymentItem{
            name: "Item 1",
            price: Decimal.new("30.0"),
            external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
          },
          %PaymentItem{
            name: "Item 2",
            price: Decimal.new("50.0"),
            external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
          },
          %PaymentItem{
            name: "Item 3",
            price: Decimal.new("20.0"),
            external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
          }
        ]
      }),
    expect: [
      post: "/payment/v1/checkout-payments/init",
      body: @fixture_request_init_checkout_payment
    ]
  )

  test_endpoint(
    "retrieve_checkout_payment/1",
    when: PaymentAdapter.retrieve_checkout_payment("456d1297-908e-4bd6-a13b-4be31a6e47d5"),
    expect: [
      get: "/payment/v1/checkout-payments/456d1297-908e-4bd6-a13b-4be31a6e47d5"
    ]
  )

  test_endpoint(
    "expire_checkout_payment/1",
    when: PaymentAdapter.expire_checkout_payment("456d1297-908e-4bd6-a13b-4be31a6e47d5"),
    expect: [
      delete: "/payment/v1/checkout-payments/456d1297-908e-4bd6-a13b-4be31a6e47d5"
    ]
  )

  test_endpoint(
    "create_deposit_payment/1",
    when:
      PaymentAdapter.create_deposit_payment(%CreateDepositPaymentRequest{
        price: Decimal.new("100.0"),
        buyer_member_id: 10,
        currency: Currency.try(),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        callback_url: "https://www.your-website.com/craftgate-deposit-callback",
        client_ip: "1.2.3.4",
        card: %Card{
          card_holder_name: "Haluk Demir",
          card_number: "5258640000000001",
          expire_year: "2044",
          expire_month: "07",
          cvc: "000"
        }
      }),
    expect: [
      post: "/payment/v1/deposits",
      body: @fixture_request_create_deposit_payment
    ]
  )

  test_endpoint(
    "init_3ds_deposit_payment/1",
    when:
      PaymentAdapter.init_3ds_deposit_payment(%CreateDepositPaymentRequest{
        price: Decimal.new("100.0"),
        buyer_member_id: 10,
        currency: Currency.try(),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        callback_url: "https://www.your-website.com/craftgate-deposit-callback",
        client_ip: "1.2.3.4",
        card: %Card{
          card_holder_name: "Haluk Demir",
          card_number: "5258640000000001",
          expire_year: "2044",
          expire_month: "07",
          cvc: "000"
        }
      }),
    expect: [
      post: "/payment/v1/deposits/3ds-init",
      body: @fixture_request_init_3ds_deposit_payment
    ]
  )

  test_endpoint(
    "complete_3ds_deposit_payment/1",
    when:
      PaymentAdapter.complete_3ds_deposit_payment(%CompleteThreeDSPaymentRequest{
        payment_id: 42
      }),
    expect: [
      post: "/payment/v1/deposits/3ds-complete",
      body: @fixture_request_complete_3ds_deposit_payment
    ]
  )

  test_endpoint(
    "create_fund_transfer_deposit_payment/1",
    when:
      PaymentAdapter.create_fund_transfer_deposit_payment(
        %CreateFundTransferDepositPaymentRequest{
          conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
          buyer_member_id: 42,
          client_ip: "1.2.3.4",
          price: Decimal.new("100.0")
        }
      ),
    expect: [
      post: "/payment/v1/deposits/fund-transfer",
      body: @fixture_request_create_fund_transfer_deposit_payment
    ]
  )

  test_endpoint(
    "init_apm_deposit_payment/1",
    when:
      PaymentAdapter.init_apm_deposit_payment(%InitApmDepositPaymentRequest{
        apm_order_id: "1234567",
        apm_user_identity: "user-1",
        callback_url: "https://www.your-website.com/craftgate-apm-init-callback",
        apm_type: ApmType.papara(),
        buyer_member_id: 42,
        currency: Currency.try(),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        client_ip: "1.2.3.4",
        external_id: "foo-123456",
        merchant_apm_id: 1042,
        payment_channel: "web",
        price: Decimal.new("100.0")
      }),
    expect: [
      post: "/payment/v1/deposits/apm-init",
      body: @fixture_request_init_apm_deposit_payment
    ]
  )

  test_endpoint(
    "init_garantipay_payment/1",
    when:
      PaymentAdapter.init_garanti_pay_payment(%InitGarantiPayPaymentRequest{
        price: Decimal.new("100.0"),
        paid_price: Decimal.new("100.0"),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        currency: Currency.try(),
        payment_group: PaymentGroup.listing_or_subscription(),
        bank_order_id: "1234567",
        items: [
          %PaymentItem{
            name: "Item 1",
            price: Decimal.new("30.0"),
            external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
          },
          %PaymentItem{
            name: "Item 2",
            price: Decimal.new("50.0"),
            external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
          },
          %PaymentItem{
            name: "Item 3",
            price: Decimal.new("20.0"),
            external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
          }
        ],
        installments: [
          %GarantiPayInstallment{number: 1, total_price: Decimal.new("100.0")},
          %GarantiPayInstallment{number: 3, total_price: Decimal.new("101.5")}
        ]
      }),
    expect: [
      post: "/payment/v1/garanti-pay-payments",
      body: @fixture_request_init_garantipay_payment
    ]
  )

  test_endpoint(
    "init_apm_payment/1",
    when:
      PaymentAdapter.init_apm_payment(%InitApmPaymentRequest{
        apm_order_id: "1234567",
        apm_user_identity: "user-1",
        callback_url: "https://www.your-website.com/craftgate-apm-init-callback",
        apm_type: ApmType.papara(),
        buyer_member_id: 42,
        currency: Currency.try(),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        client_ip: "1.2.3.4",
        external_id: "foo-123456",
        merchant_apm_id: 1042,
        payment_channel: "web",
        price: Decimal.new("100.0")
      }),
    expect: [
      post: "/payment/v1/apm-payments/init",
      body: @fixture_request_init_apm_payment
    ]
  )

  test_endpoint(
    "complete_apm_payment/1",
    when:
      PaymentAdapter.complete_apm_payment(%CompleteApmPaymentRequest{
        payment_id: 42,
        additional_params: %{"foo" => "bar"}
      }),
    expect: [
      post: "/payment/v1/apm-payments/complete",
      body: @fixture_request_complete_apm_payment
    ]
  )

  test_endpoint(
    "create_apm_payment/1",
    when:
      PaymentAdapter.create_apm_payment(%CreateApmPaymentRequest{
        apm_type: ApmType.papara(),
        price: Decimal.new("100.0"),
        paid_price: Decimal.new("100.0"),
        currency: Currency.try(),
        payment_group: PaymentGroup.listing_or_subscription(),
        payment_channel: "web",
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        external_id: "foo-123456",
        apm_order_id: "1234567",
        buyer_member_id: 42,
        client_ip: "1.2.3.4",
        items: [
          %PaymentItem{
            name: "Item 1",
            price: Decimal.new("30.0"),
            external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
          },
          %PaymentItem{
            name: "Item 2",
            price: Decimal.new("50.0"),
            external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
          },
          %PaymentItem{
            name: "Item 3",
            price: Decimal.new("20.0"),
            external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
          }
        ]
      }),
    expect: [
      post: "/payment/v1/apm-payments",
      body: @fixture_request_create_apm_payment
    ]
  )

  test_endpoint(
    "init_pos_apm_payment/1",
    when:
      PaymentAdapter.init_pos_apm_payment(%InitPosApmPaymentRequest{
        price: Decimal.new("100.0"),
        paid_price: Decimal.new("100.0"),
        currency: Currency.try(),
        payment_group: PaymentGroup.listing_or_subscription(),
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        payment_provider: PaymentProvider.ykb_world_pay(),
        callback_url: "https://www.your-website.com/craftgate-pos-apm-callback",
        additional_params: %{
          "sourceCode" => "WEB2QR"
        },
        items: [
          %PaymentItem{
            name: "Item 1",
            price: Decimal.new("30.0"),
            external_id: "123d1297-839e-4bd6-a13b-4be31a6e12a8"
          },
          %PaymentItem{
            name: "Item 2",
            price: Decimal.new("50.0"),
            external_id: "789d1297-839e-4bd6-a13b-4be31a6e13f7"
          },
          %PaymentItem{
            name: "Item 3",
            price: Decimal.new("20.0"),
            external_id: "3a1d1297-839e-4bd6-a13b-4be31a6e18e6"
          }
        ]
      }),
    expect: [
      post: "/payment/v1/pos-apm-payments/init",
      body: @fixture_request_init_pos_apm_payment
    ]
  )

  test_endpoint(
    "complete_pos_apm_payment/1",
    when:
      PaymentAdapter.complete_pos_apm_payment(%CompletePosApmPaymentRequest{
        payment_id: 42,
        additional_params: %{
          "foo" => "bar"
        }
      }),
    expect: [
      post: "/payment/v1/pos-apm-payments/complete",
      body: @fixture_request_complete_pos_apm_payment
    ]
  )

  test_endpoint(
    "retrieve_loyalties/1",
    when:
      PaymentAdapter.retrieve_loyalties(%RetrieveLoyaltiesRequest{
        card_number: "5258640000000001",
        expire_year: "2044",
        expire_month: "07",
        cvc: "000"
      }),
    expect: [
      post: "/payment/v1/card-loyalties/retrieve",
      body: @fixture_request_retrieve_loyalties
    ]
  )

  test_endpoint(
    "refund_payment_transaction/1",
    when:
      PaymentAdapter.refund_payment_transaction(%RefundPaymentTransactionRequest{
        payment_transaction_id: 42,
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        refund_price: Decimal.new("100.0"),
        refund_destination_type: RefundDestinationType.provider(),
        charge_from_me: false
      }),
    expect: [
      post: "/payment/v1/refund-transactions",
      body: @fixture_request_refund_payment_transaction
    ]
  )

  test_endpoint(
    "retrieve_payment_transaction_refund/1",
    when: PaymentAdapter.retrieve_payment_transaction_refund(42),
    expect: [
      get: "/payment/v1/refund-transactions/42"
    ]
  )

  test_endpoint(
    "refund_payment/1",
    when:
      PaymentAdapter.refund_payment(%RefundPaymentRequest{
        payment_id: 42,
        conversation_id: "456d1297-908e-4bd6-a13b-4be31a6e47d5",
        refund_destination_type: RefundDestinationType.provider(),
        charge_from_me: false
      }),
    expect: [
      post: "/payment/v1/refunds",
      body: @fixture_request_refund_payment
    ]
  )

  test_endpoint(
    "retrieve_refund/1",
    when: PaymentAdapter.retrieve_refund(42),
    expect: [
      get: "/payment/v1/refunds/42"
    ]
  )

  test_endpoint(
    "store_card/1",
    when:
      PaymentAdapter.store_card(%StoreCardRequest{
        card_holder_name: "Haluk Demir",
        card_number: "5258640000000001",
        expire_year: "2044",
        expire_month: "07",
        card_alias: "Kredi Kartim"
      }),
    expect: [
      post: "/payment/v1/cards",
      body: @fixture_request_store_card
    ]
  )

  test_endpoint(
    "update_card/1",
    when:
      PaymentAdapter.update_card(%UpdateCardRequest{
        card_user_key: "fac377f2-ab15-4696-88d2-5e71b27ec378",
        card_token: "11a078c4-3c32-4796-90b1-51ee5517a212",
        expire_year: "2044",
        expire_month: "07"
      }),
    expect: [
      post: "/payment/v1/cards/update",
      body: @fixture_request_update_card
    ]
  )

  test_endpoint(
    "search_stored_cards/1",
    when:
      PaymentAdapter.search_stored_cards(%SearchStoredCardsRequest{
        card_alias: "My YKB Card",
        card_bank_name: "YAPI VE KREDİ BANKASI A.Ş.",
        card_brand: "World",
        card_association: CardAssociation.master_card(),
        card_token: "d9b19d1a-243c-43dc-a498-add08162df72",
        card_user_key: "c115ecdf-0afc-4d83-8a1b-719c2af19cbd",
        card_type: CardType.credit_card()
      }),
    expect: [
      get:
        Enum.join(
          [
            "/payment/v1/cards?cardAlias=My%20YKB%20Card",
            "cardAssociation=MASTER_CARD",
            "cardBankName=YAPI%20VE%20KRED%C4%B0%20BANKASI%20A.%C5%9E.",
            "cardBrand=World",
            "cardToken=d9b19d1a-243c-43dc-a498-add08162df72",
            "cardType=CREDIT_CARD",
            "cardUserKey=c115ecdf-0afc-4d83-8a1b-719c2af19cbd"
          ],
          "&"
        )
    ]
  )

  test_endpoint(
    "delete_stored_card/1",
    when:
      PaymentAdapter.delete_stored_card(%DeleteStoredCardRequest{
        card_user_key: "fac377f2-ab15-4696-88d2-5e71b27ec378",
        card_token: "11a078c4-3c32-4796-90b1-51ee5517a212"
      }),
    expect: [
      post: "/payment/v1/cards/delete",
      body: @fixture_request_delete_stored_card
    ]
  )

  test_endpoint(
    "approve_payment_transactions/1",
    when:
      PaymentAdapter.approve_payment_transactions(%ApprovePaymentTransactionsRequest{
        payment_transaction_ids: [42, 1042],
        is_transactional: true
      }),
    expect: [
      post: "/payment/v1/payment-transactions/approve",
      body: @fixture_request_approve_payment_transactions
    ]
  )

  test_endpoint(
    "disapprove_payment_transactions/1",
    when:
      PaymentAdapter.disapprove_payment_transactions(%DisapprovePaymentTransactionsRequest{
        payment_transaction_ids: [42, 1042],
        is_transactional: true
      }),
    expect: [
      post: "/payment/v1/payment-transactions/disapprove",
      body: @fixture_request_disapprove_payment_transactions
    ]
  )

  test_endpoint(
    "check_masterpass_user/1",
    when:
      PaymentAdapter.check_masterpass_user(%CheckMasterpassUserRequest{
        masterpass_gsm_number: "905551234567"
      }),
    expect: [
      post: "/payment/v1/masterpass-payments/check-user",
      body: @fixture_request_check_masterpass_user
    ]
  )

  test_endpoint(
    "update_payment_transaction/1",
    when:
      PaymentAdapter.update_payment_transaction(%UpdatePaymentTransactionRequest{
        payment_transaction_id: 42,
        sub_merchant_member_id: 15,
        sub_merchant_member_price: Decimal.new("101.5")
      }),
    expect: [
      put: "/payment/v1/payment-transactions/42",
      body: @fixture_request_update_payment_transaction
    ]
  )

  describe "is_3d_secure_callback_verified?/2" do
    test "should return true if verified" do
      callback_key = "foo"

      params = %{
        "status" => "SUCCESS",
        "completeStatus" => "WAITING",
        "paymentId" => 863,
        "conversationId" => "d1811bb0-25a2-40c7-ba71-c8b605259611",
        "mdStatus" => 1,
        "hashParams" =>
          "status:callbackStatus:completeStatus:paymentId:conversationData:conversationId:mdStatus",
        "hash" => "12bb0059a6da38dad7bef6cc3c89e871484a2da10cbb4221a0340dce125fe6fd"
      }

      assert PaymentAdapter.is_3d_secure_callback_verified?(callback_key, params)
    end

    test "should return false if verified" do
      callback_key = "foo"

      params = %{
        "status" => "SUCCESS",
        "completeStatus" => "WAITING",
        "paymentId" => 863,
        "conversationId" => "d1811bb0-25a2-40c7-ba71-c8b605259611",
        "mdStatus" => 1,
        "hashParams" =>
          "status:callbackStatus:completeStatus:paymentId:conversationData:conversationId:mdStatus",
        "hash" => "invalid_hash"
      }

      assert !PaymentAdapter.is_3d_secure_callback_verified?(callback_key, params)
    end
  end
end
