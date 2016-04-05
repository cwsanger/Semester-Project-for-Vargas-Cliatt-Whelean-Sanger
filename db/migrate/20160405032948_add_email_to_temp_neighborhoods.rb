class AddEmailToTempNeighborhoods < ActiveRecord::Migration
  def change
    add_column :temp_neighborhoods, :contact_email, :string
  end
end
