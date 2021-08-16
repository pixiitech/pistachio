class LoanDecorator < SimpleDelegator
  def self.decorate_collection(loans)
    loans.map do |loan|
      new(loan)
    end
  end

  def object
    self
  end

  def customer_name
    "#{object.first_name} #{object.last_name}"
  end

  def interest_percent
    "#{object.interest_rate}%"
  end

  def monthly_payment_amount
    "$#{object.payment_amount}"
  end
end
