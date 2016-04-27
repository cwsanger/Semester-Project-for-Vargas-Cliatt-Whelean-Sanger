class CreatePasswordRequests < ActiveRecord::Migration
  def change
    create_table :password_requests do |t|
      t.string :key
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
