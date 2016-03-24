class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :likes, as: :likeable

  validates :body, presence: true

  def like(user_id)
    if likes.where(user_id: user_id).count.zero?
      likes.build(user_id: user_id)
    end
  end
end
