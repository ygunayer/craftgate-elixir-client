defmodule Craftgate.Error do
  @moduledoc """
  Represents an error that was returned by Craftgate API
  """

  defexception [:code, :description, :group]

  @typedoc """
  The unique code that represents the error
  """
  @type code :: binary()

  @typedoc """
  The human-readable error message
  """
  @type description :: binary()

  @typedoc """
  The group that the error belongs to. Only present in the case of a payment-related error.

  Use this property to differentiate payment errors.

  See https://developer.craftgate.io/en/error-groups for a list of all possible options
  """
  @type group ::
          :NOT_SUFFICIENT_FUNDS
          | :DO_NOT_HONOUR
          | :INVALID_TRANSACTION
          | :LOST_CARD
          | :STOLEN_CARD
          | :EXPIRED_CARD
          | :INVALID_CVC2
          | :NOT_PERMITTED_TO_CARDHOLDER
          | :NOT_PERMITTED_TO_TERMINAL
          | :FRAUD_SUSPECT
          | :RESTRICTED_BY_LAW
          | :CARD_NOT_PERMITTED
          | :UNKNOWN
          | :APPROVED_COMPLETED
          | :INVALID_CHARS_IN_EMAIL
          | :INVALID_CVC2_LENGTH
          | :REFER_TO_CARD_ISSUER
          | :INVALID_MERCHANT_OR_SP
          | :BLOCKED_CARD
          | :INVALID_CAVV
          | :INVALID_ECI
          | :CVC2_MAX_ATTEMPT
          | :BIN_NOT_FOUND
          | :COMMUNICATION_OR_SYSTEM_ERROR
          | :INVALID_CARD_NUMBER
          | :NO_SUCH_ISSUER
          | :DEBIT_CARDS_REQUIRES_3DS
          | :DEBIT_CARDS_INSTALLMENT_NOT_ALLOWED
          | :REQUEST_TIMEOUT
          | :DECLINED
          | :NOT_PERMITTED_TO_FOREIGN_CARD
          | :NOT_PERMITTED_TO_INSTALLMENT
          | :REQUIRES_DAY_END
          | :EXCEEDS_WITHDRAWAL_AMOUNT_LIMIT
          | :RESTRICTED_CARD
          | :EXCEEDS_ALLOWABLE_PIN_TRIES
          | :INVALID_PIN
          | :ISSUER_OR_SWITCH_INOPERATIVE
          | :INVALID_EXPIRE_YEAR_MONTH
          | :REQUEST_BLOCKED_BY_BANK
          | :SALES_AMOUNT_LESS_THAN_AWARD
          | :INVALID_AMOUNT
          | :INVALID_CARD_TYPE
          | :NOT_SUFFICIENT_AWARD
          | :AMEX_CAN_USE_ONLY_MR
          | :NO_RESPONSE
          | :PICKUP_CARD
          | :CVC_REQUIRED
          | :INVALID_IP
          | :MAY_HAVE_ALREADY_REFUNDED
          | :ORDER_ID_ALREADY_USED
          | :THREEDS_INIT_ERROR
          | :APM_ERROR
          | :FRAUD_CHECK_BLOCK
          | :POS_BALANCE_NOT_SUFFICIENT
          | binary()
          | nil

  @type t :: %__MODULE__{code: code(), description: description(), group: group()}

  def message(%__MODULE__{description: description, code: code, group: group})
      when is_nil(group) == false,
      do: "CraftgateError: #{group} - #{code} - #{description}"

  def message(%__MODULE__{description: description, code: code}),
    do: "CraftgateError: #{code} - #{description}"
end
