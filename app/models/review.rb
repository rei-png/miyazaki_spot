class Review < ApplicationRecord
  belongs_to :user
  
  
  mount_uploader :image, ImageUploader
  
  #validates :title, presence: true, length: { maximum: 255 }
  #validates :review_star, presence: true
end
