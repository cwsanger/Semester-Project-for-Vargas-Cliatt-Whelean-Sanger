class User < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :posts

  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true, uniqueness: true
end
