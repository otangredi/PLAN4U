class AddChoicesToGuestChoices < ActiveRecord::Migration[7.0]
  def change
    add_column :guest_choices, :choices, :text, array: true, default: []
  end
end
