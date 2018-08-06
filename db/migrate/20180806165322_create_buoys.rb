class CreateBuoys < ActiveRecord::Migration[5.2]
  def change
    create_table :buoys do |t|
      t.string :title
      t.integer :age
      t.text :description
      t.string :category
      t.integer :capacity
      t.float :price_per_day
      t.string :street
      t.string :number
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
