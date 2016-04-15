class Agency < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
  has_many :requests, as: :requestable
  has_many :alerts
end
