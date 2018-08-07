class RemoveReviewFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :review, foreign_key: true
  end
end
