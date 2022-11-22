class RemoveNameFromGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :guests, :name, :string
  end
end
