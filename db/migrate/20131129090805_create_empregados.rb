class CreateEmpregados < ActiveRecord::Migration
  def change
    create_table :empregados do |t|
      t.string :name
      t.integer :departamento_id

      t.timestamps
    end
  end
end
