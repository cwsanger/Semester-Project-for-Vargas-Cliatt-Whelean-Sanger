class TempUser < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end
