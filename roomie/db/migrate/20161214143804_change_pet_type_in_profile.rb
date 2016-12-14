class ChangePetTypeInProfile < ActiveRecord::Migration[5.0]
  def self.up
    change_column :profiles, :pet_friendly, :integer
  end

  def self.down
    change_column :profiles, :pet_friendly, :boolean
  end
end