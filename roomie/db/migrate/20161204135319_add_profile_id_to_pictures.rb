class AddProfileIdToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :profile_id, :integer
  end
end