class AddMemberIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :member_id, :integer
  end
end
