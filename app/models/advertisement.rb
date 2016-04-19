class Advertisement < ActiveRecord::Base
  has_many :likes, as: :likeable
  belongs_to :business
  validates :body, presence: true
  mount_uploader :picture, PictureUploader

  def like(user_id)
    if likes.where(user_id: user_id).count.zero?
      likes.build(user_id: user_id)

      return save
    end

    return false
  end
end
