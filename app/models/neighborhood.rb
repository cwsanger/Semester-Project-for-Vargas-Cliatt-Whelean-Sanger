class Neighborhood < ActiveRecord::Base
  has_many :users

  validates :name, presence: true, uniqueness: true
  after_validation :create_slug

  def to_param
    slug
  end

  private
    def create_slug
      self.slug = name.parameterize
    end
end
