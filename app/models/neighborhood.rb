class Neighborhood < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  has_many :advertisements, through: :businesses
  has_many :temp_users, as: :hood
  has_many :requests
  has_many :users
  has_many :broadcasts
  has_many :groups
  has_many :events

  has_and_belongs_to_many :businesses

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  after_validation :create_slug

  def to_param
    slug
  end

  private
    def create_slug
      self.slug = name.parameterize
    end
end
