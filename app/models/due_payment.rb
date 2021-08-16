class DuePayment < ApplicationRecord
  scope :unpaid -> { where(paid: false).order(:billing_date) }
  scope :paid -> { where(paid: true) }

  scope :past_due -> { unpaid.where('due_date < ?', Date.current) }
end
