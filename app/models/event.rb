class Event < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
