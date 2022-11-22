class AddFirstNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :FirstName, :string
  end
end
