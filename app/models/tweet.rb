class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_processing_of :image
 # belongs_to :user
end
