class RemoveFirstNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :FirstName, :string
  end
end
