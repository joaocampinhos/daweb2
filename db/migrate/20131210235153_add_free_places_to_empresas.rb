class AddFreePlacesToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :free_places, :integer
  end
end
