class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :likes, as: :likeable

  validates :body, presence: true

  def has_like(user)
    !likes.where(user_id: user.id).count.zero?
  end

  def like(user)
    likes.build(user_id: user.id)

    return save
  end

  def unlike(user)
    likes.where(user_id: user.id).destroy_all

    return save
  end
end
