class CreateGuestChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_choices do |t|
      t.string :choices
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
