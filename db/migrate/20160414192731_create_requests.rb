class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requestable_id
      t.string :requestable_type
      t.integer :neighborhood_id

      t.timestamps null: false
    end
  end
end
