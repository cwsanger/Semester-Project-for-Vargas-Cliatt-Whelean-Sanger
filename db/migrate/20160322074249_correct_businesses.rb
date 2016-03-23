class CorrectBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :email
    remove_column :businesses, :password_digest
  end
end
