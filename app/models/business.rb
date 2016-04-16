class Business < ActiveRecord::Base
  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  geocoded_by :address
  after_validation :geocode


  has_one :account, as: :member, dependent: :destroy
  has_many :requests, as: :requestable
  has_many :advertisements
  has_and_belongs_to_many :neighborhoods

  validates :name, presence: true
  validates :address, presence: true
end
