class AddAboutToEmpregados < ActiveRecord::Migration
  def change
    add_column :empregados, :about, :text
  end
end
