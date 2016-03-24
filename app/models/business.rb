class Business < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
  has_many :advertisements
end
