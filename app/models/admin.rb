class Admin < ActiveRecord::Base
  has_one :account, as: :member, dependent: :destroy
end
