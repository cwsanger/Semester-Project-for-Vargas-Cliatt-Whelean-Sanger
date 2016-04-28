class TempAgency < ActiveRecord::Base
	mount_uploader :image_url, PictureUploader
  validates :email, presence: true, superunique: true, email: true
  validates :name, presence: true
end
