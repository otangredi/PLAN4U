class AddPartnerFirstNameToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :partner_first_name, :string
  end
end
