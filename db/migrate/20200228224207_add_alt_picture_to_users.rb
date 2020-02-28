class AddAltPictureToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :alt_picture, :string
  end
end
