class ChangePetTypeInPreferences < ActiveRecord::Migration[5.0]
  def self.up
    change_column :preferences, :pet_friendly, :integer
  end

  def self.down
    change_column :preferences, :pet_friendly, :boolean
  end
end