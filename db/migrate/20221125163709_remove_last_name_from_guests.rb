class RemoveLastNameFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :last_name, :string
  end
end
