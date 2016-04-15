class Request < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :requestable, polymorphic: true
end
