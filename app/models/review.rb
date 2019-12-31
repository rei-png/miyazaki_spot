class Review < ApplicationRecord
  belongs_to :user
  
  #validates :title, presence: true, length: { maximum: 255 }
  #validates :review_star, presence: true
end
