class RemoveChoicesFromGuestChoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :guest_choices, :choices, :string
  end
end
