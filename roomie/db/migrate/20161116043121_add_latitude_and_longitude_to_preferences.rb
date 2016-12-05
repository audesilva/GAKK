class AddLatitudeAndLongitudeToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :latitude, :float
    add_column :preferences, :longitude, :float
  end
end