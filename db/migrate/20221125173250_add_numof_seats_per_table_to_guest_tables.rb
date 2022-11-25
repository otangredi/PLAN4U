class AddNumofSeatsPerTableToGuestTables < ActiveRecord::Migration[7.0]
  def change
    add_column :guest_tables, :num_of_seats, :integer
  end
end
