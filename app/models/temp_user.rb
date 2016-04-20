class TempUser < ActiveRecord::Base
  belongs_to :hood, polymorphic: true

  #validates :email, uniqueness: true, presence: true
  #Only for testing email feature!
  validates :email, presence: true
  validates :name, presence: true
end
