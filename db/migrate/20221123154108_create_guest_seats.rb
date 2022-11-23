class CreateGuestSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_seats do |t|
      t.references :guest, null: false, foreign_key: true
      t.references :guest_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
