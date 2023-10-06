defmodule Craftgate.Adapter.PaymentAdapter do
  @moduledoc """
  Provides capabilities to conduct payments, manage stored cards
  """

  use Craftgate.Adapter

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
  alias Craftgate.Request.InitApmDepositPaymentRequest
  alias Craftgate.Request.InitApmPaymentRequest
  alias Craftgate.Request.InitCheckoutPaymentRequest
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
  alias Craftgate.Response.ApmDepositPaymentResponse
  alias Craftgate.Response.ApmPaymentCompleteResponse
  alias Craftgate.Response.ApmPaymentInitResponse
  alias Craftgate.Response.CheckMasterpassUserResponse
  alias Craftgate.Response.CompletePosApmPaymentResponse
  alias Craftgate.Response.DepositPaymentResponse
  alias Craftgate.Response.FundTransferDepositPaymentResponse
  alias Craftgate.Response.InitCheckoutPaymentResponse
  alias Craftgate.Response.InitGarantiPayPaymentResponse
  alias Craftgate.Response.InitPosApmPaymentResponse
  alias Craftgate.Response.InitThreeDSPaymentResponse
  alias Craftgate.Response.PaymentRefundResponse
  alias Craftgate.Response.PaymentResponse
  alias Craftgate.Response.PaymentTransactionApprovalListResponse
  alias Craftgate.Response.PaymentTransactionRefundResponse
  alias Craftgate.Response.PaymentTransactionResponse
  alias Craftgate.Response.RetrieveLoyaltiesResponse
  alias Craftgate.Response.StoredCardListResponse
  alias Craftgate.Response.StoredCardResponse

  endpoint create_payment(body: CreatePaymentRequest.t()), post: "/payment/v1/card-payments", return: PaymentResponse.t()

  endpoint init_3ds_payment(body: InitThreeDSPaymentRequest.t()), post: "/payment/v1/card-payments/3ds-init", return: InitThreeDSPaymentResponse.t()

  endpoint complete_3ds_payment(body: CompleteThreeDSPaymentRequest.t()), post: "/payment/v1/card-payments/3ds-complete", return: PaymentResponse.t()

  endpoint post_auth_payment(payment_id: integer(), body: PostAuthPaymentRequest.t()), post: "/payment/v1/card-payments/:payment_id/post-auth", return: PaymentResponse.t()

  endpoint init_checkout_payment(body: InitCheckoutPaymentRequest.t()), post: "/payment/v1/checkout-payments/init", return: InitCheckoutPaymentResponse.t()

  endpoint retrieve_checkout_payment(token: String.t()), get: "/payment/v1/checkout-payments/:token", return: PaymentResponse.t()

  endpoint expire_checkout_payment(token: String.t()), delete: "/payment/v1/checkout-payments/:token"

  endpoint create_deposit_payment(body: CreateDepositPaymentRequest.t()), post: "/payment/v1/deposits", return: DepositPaymentResponse.t()

  endpoint init_3ds_deposit_payment(body: CreateDepositPaymentRequest.t()), post: "/payment/v1/deposits/3ds-init", return: InitThreeDSPaymentResponse.t()

  endpoint complete_3ds_deposit_payment(body: CompleteThreeDSPaymentRequest.t()), post: "/payment/v1/deposits/3ds-complete", return: DepositPaymentResponse.t()

  endpoint create_fund_transfer_deposit_payment(body: CreateFundTransferDepositPaymentRequest.t()), post: "/payment/v1/deposits/fund-transfer", return: FundTransferDepositPaymentResponse.t()

  endpoint init_apm_deposit_payment(body: InitApmDepositPaymentRequest.t()), post: "/payment/v1/deposits/apm-init", return: ApmDepositPaymentResponse.t()

  endpoint init_garanti_pay_payment(body: InitGarantiPayPaymentRequest.t()), post: "/payment/v1/garanti-pay-payments", return: InitGarantiPayPaymentResponse.t()

  endpoint init_apm_payment(body: InitApmPaymentRequest.t()), post: "/payment/v1/apm-payments/init", return: ApmPaymentInitResponse.t()

  endpoint complete_apm_payment(body: CompleteApmPaymentRequest.t()), post: "/payment/v1/apm-payments/complete", return: ApmPaymentCompleteResponse.t()

  endpoint create_apm_payment(body: CreateApmPaymentRequest.t()), post: "/payment/v1/apm-payments", return: PaymentResponse.t()

  endpoint init_pos_apm_payment(body: InitPosApmPaymentRequest.t()), post: "/payment/v1/pos-apm-payments/init", return: InitPosApmPaymentResponse.t()

  endpoint complete_pos_apm_payment(body: CompletePosApmPaymentRequest.t()), post: "/payment/v1/pos-apm-payments/complete", return: CompletePosApmPaymentResponse.t()

  endpoint retrieve_loyalties(body: RetrieveLoyaltiesRequest.t()), post: "/payment/v1/card-loyalties/retrieve", return: RetrieveLoyaltiesResponse.t()

  endpoint refund_payment_transaction(body: RefundPaymentTransactionRequest.t()), post: "/payment/v1/refund-transactions", return: PaymentTransactionRefundResponse.t()

  endpoint retrieve_payment_transaction_refund(id: integer()), get: "/payment/v1/refund-transactions/:id", return: PaymentRefundResponse.t()

  endpoint refund_payment(body: RefundPaymentRequest.t()), post: "/payment/v1/refunds", return: PaymentRefundResponse.t()

  endpoint retrieve_refund(id: integer()), get: "/payment/v1/refunds/:id", return: PaymentRefundResponse.t()

  endpoint store_card(body: StoreCardRequest.t()), post: "/payment/v1/cards", return: StoredCardResponse.t()

  endpoint update_card(body: UpdateCardRequest.t()), post: "/payment/v1/cards/update", return: StoredCardResponse.t()

  endpoint search_stored_cards(params: SearchStoredCardsRequest.t()), get: "/payment/v1/cards", return: StoredCardListResponse.t()

  endpoint delete_stored_card(body: DeleteStoredCardRequest.t()), post: "/payment/v1/cards/delete"

  endpoint approve_payment_transactions(body: ApprovePaymentTransactionsRequest.t()), post: "/payment/v1/payment-transactions/approve", return: PaymentTransactionApprovalListResponse.t()

  endpoint disapprove_payment_transactions(body: DisapprovePaymentTransactionsRequest.t()), post: "/payment/v1/payment-transactions/disapprove", return: PaymentTransactionApprovalListResponse.t()

  endpoint check_masterpass_user(body: CheckMasterpassUserRequest.t()), post: "/payment/v1/masterpass-payments/check-user", return: CheckMasterpassUserResponse.t()

  endpoint update_payment_transaction(body: UpdatePaymentTransactionRequest.t()),
    put: fn body, _ -> "/payment/v1/payment-transactions/#{body.payment_transaction_id}" end,
    return: PaymentTransactionResponse.t()

  @spec is_3d_secure_callback_verified?(binary(), map()) :: boolean()
  def is_3d_secure_callback_verified?(threed_secure_callback_key, params) do
    hash = params["hash"]
    hash_params = Map.get(params, "hashParams", "status:callbackStatus:completeStatus:paymentId:conversationData:conversationId:mdStatus")

    parts =
      hash_params
      |> String.split(":")
      |> Enum.map(&Map.get(params, &1, ""))

    hash_string = Enum.join([threed_secure_callback_key | parts], "###")

    hashed_string =
      :crypto.hash(:sha256, hash_string)
      |> Base.encode16()
      |> String.downcase()

    hashed_string == hash
  end
end
