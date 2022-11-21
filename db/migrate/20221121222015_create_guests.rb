class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :relationship
      t.string :email
      t.integer :status
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
