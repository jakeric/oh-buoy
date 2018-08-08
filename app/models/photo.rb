class Photo < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :buoy

  validates :photo, presence: true, uniqueness: true
end
