class CorrectAgencies < ActiveRecord::Migration
  def change
    remove_column :agencies, :email
    remove_column :agencies, :password_digest
  end
end
