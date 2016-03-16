class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :comments

  validates :body, presence: true

  def like
    update_attribute :likes, likes + 1
  end
end
