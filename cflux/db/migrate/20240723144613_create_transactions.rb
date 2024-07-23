class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.date :date
      t.string :category
      t.text :description
      t.string :transaction_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
