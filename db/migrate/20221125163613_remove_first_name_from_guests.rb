class RemoveFirstNameFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :first_name, :string
  end
end
