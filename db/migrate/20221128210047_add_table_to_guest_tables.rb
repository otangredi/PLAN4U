class AddTableToGuestTables < ActiveRecord::Migration[7.0]
  def change
    add_column :guest_tables, :tables, :text, array: true, default: []
  end
end
