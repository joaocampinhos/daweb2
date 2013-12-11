class AddLogoToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :logo, :binary
  end
end
