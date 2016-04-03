class AddNeighborhoodIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :neighborhood_id, :integer
  end
end
