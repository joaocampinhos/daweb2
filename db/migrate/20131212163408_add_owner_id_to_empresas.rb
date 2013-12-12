class AddOwnerIdToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :owner_id, :integer
  end
end
