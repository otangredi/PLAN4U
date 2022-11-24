class AddTemplateIdToEVites < ActiveRecord::Migration[7.0]
  def change
    add_column :e_vites, :template_id, :string
  end
end
