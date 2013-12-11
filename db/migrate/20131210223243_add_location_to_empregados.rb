class AddLocationToEmpregados < ActiveRecord::Migration
  def change
    add_column :empregados, :location, :string
  end
end
