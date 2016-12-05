class UpdateProfileAndPreferencesPostalCodeToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :profiles, :postal_code, :string
  	change_column :preferences, :postal_code, :string
  end
end
