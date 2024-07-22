class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :name, null: false
      t.string :password_digest 
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
