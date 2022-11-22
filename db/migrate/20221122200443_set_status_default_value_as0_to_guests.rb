class SetStatusDefaultValueAs0ToGuests < ActiveRecord::Migration[7.0]
  def change
    change_column :guests, :status, :integer, default: 0
  end
end
