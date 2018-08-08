class AddPhotoToBuoy < ActiveRecord::Migration[5.2]
  def change
    add_column :buoys, :photo, :string
  end
end
