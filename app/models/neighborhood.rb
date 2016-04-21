class Neighborhood < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  has_many :advertisements, through: :businesses
  has_many :alerts, through: :agencies

  has_many :temp_users, as: :hood
  has_many :requests
  has_many :users
  has_many :broadcasts
  has_many :groups
  has_many :events

  has_and_belongs_to_many :businesses
  has_and_belongs_to_many :agencies

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
