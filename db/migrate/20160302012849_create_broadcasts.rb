class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
