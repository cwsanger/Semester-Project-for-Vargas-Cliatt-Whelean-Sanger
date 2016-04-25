class Event < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  mount_uploader :image_url, PictureUploader
end
