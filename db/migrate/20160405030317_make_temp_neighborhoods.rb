class MakeTempNeighborhoods < ActiveRecord::Migration
  def change
    create_table :temp_neighborhoods do |t|
      t.string :name
      t.string :address
    end
  end
end
