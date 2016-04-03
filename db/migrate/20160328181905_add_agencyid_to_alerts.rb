class AddAgencyidToAlerts < ActiveRecord::Migration
  def up
    add_column :alerts, :agency_id, :integer
  end

  def down
    remove_column :alerts, :agency_id
  end
end
