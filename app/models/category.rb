class Category < ActiveRecord::Base
  has_many :posts

  validates :type, presence: true
end
