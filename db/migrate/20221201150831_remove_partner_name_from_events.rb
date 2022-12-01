class RemovePartnerNameFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :partner_name, :string
  end
end
