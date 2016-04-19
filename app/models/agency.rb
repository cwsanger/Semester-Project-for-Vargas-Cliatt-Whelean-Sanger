class Agency < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
  has_many :alerts
  mount_uploader :image_url, PictureUploader
end
