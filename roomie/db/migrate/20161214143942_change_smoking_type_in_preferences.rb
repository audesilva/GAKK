class ChangeSmokingTypeInPreferences < ActiveRecord::Migration[5.0]
  def self.up
    change_column :preferences, :smoker, :integer
  end

  def self.down
    change_column :preferences, :smoker, :boolean
  end
end