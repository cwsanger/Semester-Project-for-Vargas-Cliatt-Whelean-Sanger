class CreateAgenciesAndNeighborhoodsJoinTable < ActiveRecord::Migration
  def change
    create_table :agencies_neighborhoods do |t|
      t.integer :agency_id
      t.integer :neighborhood_id
    end
  end
end
