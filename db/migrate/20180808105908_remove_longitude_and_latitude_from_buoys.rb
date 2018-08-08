class RemoveLongitudeAndLatitudeFromBuoys < ActiveRecord::Migration[5.2]
  def change
    remove_column :buoys, :latitude, :string
    remove_column :buoys, :longitude, :string
  end
end
