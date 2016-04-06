class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :neighborhood_id
      t.integer :user_id
      t.string :name
      t.string :body

      t.timestamps null: false
    end
  end
end
