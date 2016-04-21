class AddGeocodeInfoToBusinessesAndAgencies < ActiveRecord::Migration
  def change
    add_column :businesses, :address, :string
    add_column :businesses, :longitude, :float
    add_column :businesses, :latitude, :float

    add_column :agencies, :address, :string
    add_column :agencies, :longitude, :float
    add_column :agencies, :latitude, :float
  end
end
