class Profile < ApplicationRecord
    
  belongs_to :user
  mount_uploader :userimage, ImageUploader
end
