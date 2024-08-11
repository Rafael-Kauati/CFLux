class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:edit_transaction, :update_transaction, :destroy_transaction]

  def index
    # Calculate Financial Summary (not affected by the filter)
    @total_income = current_user.transactions.where(transaction_type: 'income').sum(:amount) || 0
    @total_expenses = current_user.transactions.where(transaction_type: 'expense').sum(:amount) || 0
    @balance = @total_income - @total_expenses

    # Filter Recent Transactions (based on the selected filter)
    @transaction_type = params[:transaction_type] || 'all'
    filtered_transactions = current_user.transactions.order(date: :desc)

    if @transaction_type == 'income'
      filtered_transactions = filtered_transactions.where(transaction_type: 'income')
    elsif @transaction_type == 'expense'
      filtered_transactions = filtered_transactions.where(transaction_type: 'expense')
    end

    @recent_transactions = filtered_transactions.limit(5)
    @transaction = Transaction.new
  end
  

  def create_transaction
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      redirect_to home_path, notice: 'Transaction was successfully created.'
    else
      # Recalculate these in case of a failed save
      @total_income = current_user.transactions.where(transaction_type: 'income').sum(:amount) || 0
      @total_expenses = current_user.transactions.where(transaction_type: 'expense').sum(:amount) || 0
      @balance = @total_income - @total_expenses
      @recent_transactions = current_user.transactions.order(date: :desc).limit(5)
      render :index
    end
  end
  

  def edit_transaction
  end

  def update_transaction
    if @transaction.update(transaction_params)
      redirect_to home_path, notice: 'Transaction was successfully updated.'
    else
      render :edit_transaction
    end
  end

  def destroy_transaction
    @transaction.destroy
    redirect_to home_path, notice: 'Transaction was successfully deleted.'
  end

  private

  def authenticate_user!
    redirect_to new_singin_path unless user_signed_in?
  end

  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end


  def transaction_params
    params.require(:transaction).permit(:amount, :date, :category, :description, :transaction_type)
  end

end
