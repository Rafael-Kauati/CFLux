module ApplicationHelper
    def balance_class(balance)
      if balance > 0
        'balance-positive'
      elsif balance < 0
        'balance-negative'
      else
        'balance-zero'
      end
    end
end
  