class AddDescriptionToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :description, :text
  end
end
