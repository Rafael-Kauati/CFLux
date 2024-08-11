class ModifyCategoryInTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :category, :string, default: 'Tax'
  end
end
