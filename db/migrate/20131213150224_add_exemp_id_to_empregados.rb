class AddExempIdToEmpregados < ActiveRecord::Migration
  def change
    add_column :empregados, :exemp_id, :string
  end
end
