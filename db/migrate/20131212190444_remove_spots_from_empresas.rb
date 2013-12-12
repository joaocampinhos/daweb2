class RemoveSpotsFromEmpresas < ActiveRecord::Migration
  def change
    remove_column :empresas, :spots, :integer
  end
end
