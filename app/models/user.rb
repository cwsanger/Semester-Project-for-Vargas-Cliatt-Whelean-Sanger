class User < ActiveRecord::Base
  #  to be uncommented and integrated after the demo
#  geocoded_by :address
#  after_validation :geocode

  belongs_to :neighborhood
  has_many :posts
  has_one :account, as: :member, dependent: :destroy

  validates :name, presence: true
#  validates :address, presence: true
end
