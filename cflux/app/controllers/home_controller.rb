class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_income = current_user.transactions.where(transaction_type: 'income').sum(:amount)
    @total_expenses = current_user.transactions.where(transaction_type: 'expense').sum(:amount)
    @balance = @total_income - @total_expenses
    @recent_transactions = current_user.transactions.order(date: :desc).limit(5)
  end

  private

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end
end
