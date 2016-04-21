class AddPictures < ActiveRecord::Migration
  def change
  	add_column :users, :image_url, :string
  	add_column :temp_users, :image_url, :string
  	add_column :temp_agencies, :image_url, :string
  	add_column :temp_businesses, :image_url, :string
  	add_column :agencies, :image_url, :string
  	add_column :businesses, :image_url, :string
  	add_column :posts, :image_url, :string
  	add_column :events, :image_url, :string
  	add_column :advertisements, :image_url, :string
  end
end
