class TempBusiness < ActiveRecord::Base
	mount_uploader :image_url, PictureUploader
end
