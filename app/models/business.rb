class Business < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
end
