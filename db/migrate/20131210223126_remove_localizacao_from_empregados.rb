class RemoveLocalizacaoFromEmpregados < ActiveRecord::Migration
  def change
    remove_column :empregados, :localizacao, :string
  end
end
