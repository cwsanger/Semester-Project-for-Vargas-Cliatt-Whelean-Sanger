class Advertisement < ActiveRecord::Base
  has_many :likes, as: :likeable
  belongs_to :business
  validates :body, presence: true

  mount_uploader :image_url, PictureUploader

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
