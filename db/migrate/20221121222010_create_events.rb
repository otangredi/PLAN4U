class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :venue
      t.string :partner_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
