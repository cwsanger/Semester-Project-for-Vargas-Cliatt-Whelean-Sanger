class CorrectUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :password
    add_column :users, :account_id, :integer
  end
end
