class AddExempIdToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :exemp_id, :string
  end
end
