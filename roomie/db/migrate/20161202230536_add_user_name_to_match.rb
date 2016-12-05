class AddUserNameToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :user_name, :string
  end
end
