class User < ActiveRecord::Base
  #  to be uncommented and integrated after the demo
#  geocoded_by :address
#  after_validation :geocode

  enum role: [:normy, :lead, :hoa]

  belongs_to :neighborhood

  has_and_belongs_to_many :groups

  has_many :posts
  has_many :messages

  has_many :sent_messages, class_name: 'DirectMessage', foreign_key: 'from_id'
  has_many :received_messages, class_name: 'DirectMessage', foreign_key: 'to_id'

  has_many :comments
  has_many :direct_messages, through: :direct_links

  has_one :account, as: :member, dependent: :destroy

  validates :name, presence: true
#  validates :address, presence: true
end
