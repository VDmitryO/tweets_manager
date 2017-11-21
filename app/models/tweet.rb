class Tweet < ApplicationRecord
  validates :text, length: { maximum: 280}, presence: true
  mount_uploader :image, ImageUploader
  validates_processing_of :image
 # belongs_to :user
end
