class TempNeighborhood < ActiveRecord::Base
  has_many :temp_users, as: :hood

  validates :address, uniqueness: true, presence: true
  validates :name, presence: true
end
