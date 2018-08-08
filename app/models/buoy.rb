class Buoy < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :photos

  validates :title, presence: true
  validates :age, presence: true
  validates :category, presence: true, inclusion: { in: ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"] }
  validates :capacity, presence: true
  validates :price_per_day, numericality: true, presence: true
<<<<<<< HEAD
  validates :photo, presence:true
=======
>>>>>>> b3dd182e895f9ae6886fa1af63135052b3156cb6
end
