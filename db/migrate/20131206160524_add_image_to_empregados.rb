class AddImageToEmpregados < ActiveRecord::Migration
  def change
    add_column :empregados, :image, :integer
  end
end
