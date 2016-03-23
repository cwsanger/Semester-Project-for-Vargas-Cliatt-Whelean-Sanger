class AddMemberTypeToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :member_type, :string
  end
end
