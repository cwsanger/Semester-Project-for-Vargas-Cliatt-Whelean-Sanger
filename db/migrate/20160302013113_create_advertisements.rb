class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
