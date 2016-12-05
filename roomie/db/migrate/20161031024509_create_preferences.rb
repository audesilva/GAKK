class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.string :gender
      t.boolean :smoker
      t.boolean :pet_friendly
      t.integer :cleanliness_level
      t.integer :outgoingness_level
      t.integer :quietness_level
      t.boolean :looking_for_residence
      t.string :street
      t.string :city
      t.string :state
      t.integer :postal_code
      t.integer :user_id

      t.timestamps
    end
    add_index :preferences, :user_id
  end
end
