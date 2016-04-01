class Neighborhood < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  has_many :users
  has_many :groups

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
