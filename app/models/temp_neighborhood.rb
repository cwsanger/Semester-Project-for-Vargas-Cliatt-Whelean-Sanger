class TempNeighborhood < ActiveRecord::Base
  validates :contact_email, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :name, presence: true
end
