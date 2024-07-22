class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :password_digest

      t.timestamps
    end

    # Add unique index on email column
    add_index :users, :email, unique: true
  end
end
