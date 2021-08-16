class Loan < ApplicationRecord
  has_many :payments
  has_many :transactions
  has_many :due_payments

  after_save :update_balances!

  default_scope :active

  scope :active, -> { where(archived_at: nil) }

  def active_transactions
    @active_transactions ||= transactions.active
  end

  def past_due_date
    due_payments.past_due.first&.due_date
  end

  def get_days_past_due
    (Date.current - (past_due_date || Date.current)).to_i
  end

  def update_balances
    self.principal_balance = active_transactions.sum(:principal_change)
    self.interest_balance  = active_transactions.sum(:interest_change)
    self.fees_balance      = active_transactions.sum(:fees_change)
    self.days_past_due     = get_days_past_due
  end

  def update_balances!
    update_balances
    save
  end
end
