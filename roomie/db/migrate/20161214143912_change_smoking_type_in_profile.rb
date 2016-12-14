class ChangeSmokingTypeInProfile < ActiveRecord::Migration[5.0]
  def self.up
    change_column :profiles, :is_a_smoker, :integer
  end

  def self.down
    change_column :profiles, :is_a_smoker, :boolean
  end
end