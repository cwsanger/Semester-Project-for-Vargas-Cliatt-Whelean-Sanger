class Post < ActiveRecord::Base
  before_destroy :user_remove_post_callback

  enum status: [:no_flag, :flag]

  belongs_to :user
  belongs_to :category
  mount_uploader :image_url, PictureUploader

  has_many :comments
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

  private
    def user_remove_post_callback
      u = self.user
      u.remove_post_callback
      u.save
    end
end
