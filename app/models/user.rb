class User < ActiveRecord::Base
  #  to be uncommented and integrated after the demo
#  geocoded_by :address
#  after_validation :geocode

  belongs_to :neighborhood
  has_many :posts
  has_many :comments

  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true, uniqueness: true
#  validates :address, presence: true
end
