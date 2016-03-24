class CreateBusinessAndNeighborhodJoinTable < ActiveRecord::Migration
  def change
    create_table :businesses_neighborhoods do |t|
      t.integer :business_id
      t.integer :neighborhood_id
    end
  end
end
