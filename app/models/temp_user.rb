class TempUser < ActiveRecord::Base
  belongs_to :hood, polymorphic: true

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end
