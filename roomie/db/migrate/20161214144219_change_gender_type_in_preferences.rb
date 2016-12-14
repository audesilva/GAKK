class ChangeGenderTypeInPreferences < ActiveRecord::Migration[5.0]
  def self.up
    change_column :preferences, :gender, :integer
  end

  def self.down
    change_column :preferences, :gender, :string
  end
end