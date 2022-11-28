class AddThreeColumnsToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :guest_list, :boolean, default: false
    add_column :users, :design_cards, :boolean, default: false
    add_column :users, :send_cards, :boolean, default: false
  end
end
