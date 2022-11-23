class CreateGuestTables < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_tables do |t|
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
