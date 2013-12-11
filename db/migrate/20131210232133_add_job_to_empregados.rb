class AddJobToEmpregados < ActiveRecord::Migration
  def change
    add_column :empregados, :job, :string
  end
end
