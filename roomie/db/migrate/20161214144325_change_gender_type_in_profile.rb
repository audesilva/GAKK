class ChangeGenderTypeInProfile < ActiveRecord::Migration[5.0]
  def self.up
    change_column :profiles, :gender, :integer
  end

  def self.down
    change_column :profiles, :gender, :string
  end
end