class AddHoaFlagToTempUsers < ActiveRecord::Migration
  def change
    add_column :temp_users, :hoa, :boolean, default: false
  end
end
