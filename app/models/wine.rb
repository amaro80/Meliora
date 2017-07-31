class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :vineyard
  mount_uploader :image_url, ImageUploader
  
end
