class DirectMessage < ActiveRecord::Base
  belongs_to :to, class_name: 'User', foreign_key: 'to_id'
  belongs_to :from, class_name: 'User', foreign_key: 'from_id'  
  mount_uploader :image_url, PictureUploader

  
end
