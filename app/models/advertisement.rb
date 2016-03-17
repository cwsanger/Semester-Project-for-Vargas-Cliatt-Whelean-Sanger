class Advertisement < ActiveRecord::Base
  validates :body, presence: true

  def like
    update_attribute :likes, likes + 1
  end
end
