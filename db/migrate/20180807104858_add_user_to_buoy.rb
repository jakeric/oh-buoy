class AddUserToBuoy < ActiveRecord::Migration[5.2]
  def change
    add_reference :buoys, :user, foreign_key: true
  end
end
