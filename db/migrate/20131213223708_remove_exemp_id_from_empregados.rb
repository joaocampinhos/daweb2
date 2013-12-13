class RemoveExempIdFromEmpregados < ActiveRecord::Migration
  def change
    remove_column :empregados, :exemp_id, :string
  end
end
