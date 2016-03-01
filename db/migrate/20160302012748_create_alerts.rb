class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :body
      t.integer :severity

      t.timestamps null: false
    end
  end
end
