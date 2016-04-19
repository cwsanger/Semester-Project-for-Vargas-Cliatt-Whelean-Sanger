class Event < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :user
  mount_uploader :image_url, PictureUploader
end
