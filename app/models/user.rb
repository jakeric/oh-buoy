class User < ApplicationRecord
  has_many :buoys
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :photos

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
