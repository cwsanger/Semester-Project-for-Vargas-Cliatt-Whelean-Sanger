class AddNeighborhoodIdToBroadcasts < ActiveRecord::Migration
  def change
    add_column :broadcasts, :neighborhood_id, :integer
  end
end
