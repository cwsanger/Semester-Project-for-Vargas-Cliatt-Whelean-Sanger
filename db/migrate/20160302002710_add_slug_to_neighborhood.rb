class AddSlugToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :slug, :string
  end
end
