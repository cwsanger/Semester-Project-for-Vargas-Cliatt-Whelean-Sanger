class Neighborhood < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  has_many :advertisements, through: :businesses
  has_many :temp_users, as: :hood
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

  def self.search_for(searchString)
    # Need to validate/sanitize searchString here
    all.to_a.delete_if { |neighborhood| !matches?(searchString, neighborhood) }
  end

  def search_fields
    [self.name, self.address]
  end

  private
    def create_slug
      self.slug = name.parameterize
    end

    def self.matches?(phrase, neighborhood)
      fields = neighborhood.search_fields

      fields.map!(&:downcase)
      phrase.downcase!

      fields.each do |field|
        if (
             (phrase.include? field) ||
             (field.include? phrase)
            )
          return true
        end
      end

      false
    end

end
