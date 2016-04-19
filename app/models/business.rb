class Business < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
  has_many :advertisements
  has_and_belongs_to_many :neighborhoods
  mount_uploader :image_url, PictureUploader
end
