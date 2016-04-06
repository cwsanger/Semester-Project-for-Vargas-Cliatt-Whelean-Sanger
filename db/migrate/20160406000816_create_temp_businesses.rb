class CreateTempBusinesses < ActiveRecord::Migration
  def change
    create_table :temp_businesses do |t|
      t.string :name
      t.string :address
      t.string :email

      t.timestamps null: false
    end
  end
end
