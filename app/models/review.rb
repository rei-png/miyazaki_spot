class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :spot_id, presence: true
end
