class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :gender
      t.boolean :is_a_smoker
      t.boolean :pet_friendly
      t.integer :cleanliness_level
      t.integer :outgoingness_level
      t.integer :quietness_level
      t.boolean :has_residence_already
      t.string :street
      t.string :city
      t.string :state
      t.integer :postal_code

      t.timestamps
    end
  end
end
