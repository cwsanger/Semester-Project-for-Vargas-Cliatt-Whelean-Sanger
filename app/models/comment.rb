class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  def like
    update_attribute :likes, likes + 1
  end
end
