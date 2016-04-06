class User < ActiveRecord::Base
  #  to be uncommented and integrated after the demo
#  geocoded_by :address
#  after_validation :geocode

  enum role: [:normy, :lead, :hoa]

  belongs_to :neighborhood

  has_and_belongs_to_many :groups

  has_many :posts
  has_many :messages
  has_many :events

  has_many :sent_messages, class_name: 'DirectMessage', foreign_key: 'from_id'
  has_many :received_messages, class_name: 'DirectMessage', foreign_key: 'to_id'

  has_many :comments
  has_many :direct_messages, through: :direct_links

  has_one :account, as: :member, dependent: :destroy

  validates :name, presence: true
#  validates :address, presence: true

  def is_in_group(group)
    self.groups.inject(false) {|acc, g| acc || (g.id == group.id)}
  end

  def post(post_params)
    posts.build(post_params)
    add_points(3)
  end

  def comment(post, comment_params)
    post.comments.build(comment_params.merge(user_id: id))

    if post.save
      add_points(2)
    end
  end

  def like(likeable)
    if likeable.like(id)
      add_points(1)
    end
  end

  private
    def add_points(value)
      self.points += value

      if self.points >= 100 and self.normy?
        self.lead!
      end
    end
end
