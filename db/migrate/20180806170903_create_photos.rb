class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo
      t.references :user, foreign_key: true
      t.references :buoy, foreign_key: true

      t.timestamps
    end
  end
end
