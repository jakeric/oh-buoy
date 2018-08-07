class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :buoy

  validates :photo, presence: true, uniqueness: true
end
