class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :likes, as: :likeable

  validates :body, presence: true
  mount_uploader :image_url, PictureUploader

  def like(user_id)
    if likes.where(user_id: user_id).count.zero?
      likes.build(user_id: user_id)

      return save
    end

    return false
  end
end
