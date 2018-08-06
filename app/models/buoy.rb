class Buoy < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :photos

  validates :title, presence: true
  validates :age, presence: true
  validates :description #, presence: true
  validates :category, inclusion: { in: ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"] }
  validates :capacity, presence: true
  validates :price_per_day, numericability: true, presence: true
  # validates :street
  # validates :number
  # validates :city
  # validates :postal_codes
  # validates :country
  # validates :latitude
  # validates :longitude
end
