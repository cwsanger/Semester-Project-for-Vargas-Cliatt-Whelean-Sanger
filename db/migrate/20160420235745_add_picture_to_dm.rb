class AddPictureToDm < ActiveRecord::Migration
  def change
    add_column :direct_messages, :image_url, :string
  end
end
