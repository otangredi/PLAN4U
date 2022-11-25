class AddNameToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :name, :string
  end
end
