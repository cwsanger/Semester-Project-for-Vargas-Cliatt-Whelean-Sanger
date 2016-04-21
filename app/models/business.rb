class Business < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  has_one :account, as: :member, dependent: :destroy
  has_many :requests, as: :requestable
  has_many :advertisements

  has_and_belongs_to_many :neighborhoods

  validates :name, presence: true
  validates :address, presence: true
  mount_uploader :image_url, PictureUploader
end
