class CorrectUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :password_digest
    add_column :users, :account_id, :integer
  end
end
