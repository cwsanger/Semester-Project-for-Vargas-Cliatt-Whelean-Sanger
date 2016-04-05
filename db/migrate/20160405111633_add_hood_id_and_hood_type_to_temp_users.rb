class AddHoodIdAndHoodTypeToTempUsers < ActiveRecord::Migration
  def change
    add_column :temp_users, :hood_id, :integer
    add_column :temp_users, :hood_type, :string
  end
end
