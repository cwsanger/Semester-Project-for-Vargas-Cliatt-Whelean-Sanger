class TempNeighborhood < ActiveRecord::Base
  has_many :temp_users, as: :hood
  mount_uploader :picture, PictureUploader

  validates :address, uniqueness: true, presence: true
  validates :name, presence: true
end
