class Agency < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  has_one :account, as: :member, dependent: :destroy
  has_many :requests, as: :requestable
  has_many :alerts

  validates :name, presence: true
  validates :address, presence: true
end
