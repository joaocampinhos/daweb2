class AddSpotsToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :spots, :integer
  end
end
