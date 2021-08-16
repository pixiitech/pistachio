class LoansController < ApplicationController
  def index
    @loans = LoanDecorator.decorate_collection(Loan.all)
  end
end
