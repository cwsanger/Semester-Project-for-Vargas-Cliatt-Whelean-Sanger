class Business < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
  has_many :advertisements
  has_and_belongs_to_many :neighborhoods
end
