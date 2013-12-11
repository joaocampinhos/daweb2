class RemoveFreePlacesFromEmpresas < ActiveRecord::Migration
  def change
    remove_column :empresas, :free_placest, :int
  end
end
