class Booking < ApplicationRecord
  validate :end_after_start
  belongs_to :buoy
  belongs_to :user
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true #, date: { after_or_equal_to:  :start_date}


  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
