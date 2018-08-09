class AddTotalpriceToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :total_price, :float
  end
end
