class AddPartnerLastNameToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :partner_last_name, :string
  end
end
