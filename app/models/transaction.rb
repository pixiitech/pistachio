class Transaction < ApplicationRecord
  belongs_to :loan

  enum transaction_type: {
    principal_advance: 100,
    principal_reduction: 102,
    principal_payment: 104,
    interest_accrual: 200,
    interest_reduction: 202,
    interest_payment: 204,
    late_fee: 350,
    late_fee_payment: 352,
    convenience_fee: 360,
    convenience_fee_payment: 362,
    return_fee: 370,
    return_fee_payment: 372,
    write_off_principal: 400,
    write_off_interest: 402,
    write_off_fees: 404
  }

  scope :active, -> { where(reversed: false, reversal: false) }
end
