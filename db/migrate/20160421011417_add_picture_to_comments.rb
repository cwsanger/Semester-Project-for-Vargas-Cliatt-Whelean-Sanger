class AddPictureToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :image_url, :string
  end
end
