class AddLastnameToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :last_name, :string
  end
end
