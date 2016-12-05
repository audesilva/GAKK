class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :user_id_1
      t.integer :user_id_2
      t.integer :percent_match

      t.timestamps
    end
  end
end
