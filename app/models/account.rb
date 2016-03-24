class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :member, polymorphic: true

  validates :email, presence: true, uniqueness: true, email: true
end
