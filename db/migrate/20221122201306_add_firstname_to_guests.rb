class AddFirstnameToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :first_name, :string
  end
end
