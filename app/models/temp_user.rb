class TempUser < ActiveRecord::Base
  belongs_to :hood, polymorphic: true
  mount_uploader :picture, PictureUploader

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end
