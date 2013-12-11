class AddLocalizacaoToEmpregados < ActiveRecord::Migration
  def change
    add_column :empregados, :localizacao, :string
  end
end
