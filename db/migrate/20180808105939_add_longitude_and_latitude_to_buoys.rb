class AddLongitudeAndLatitudeToBuoys < ActiveRecord::Migration[5.2]
  def change
    add_column :buoys, :latitude, :float
    add_column :buoys, :longitude, :float
  end
end
