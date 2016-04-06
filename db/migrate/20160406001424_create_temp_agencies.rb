class CreateTempAgencies < ActiveRecord::Migration
  def change
    create_table :temp_agencies do |t|
      t.string :name
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
