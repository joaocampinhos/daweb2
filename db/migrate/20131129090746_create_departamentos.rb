class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :name
      t.integer :empresa_id

      t.timestamps
    end
  end
end
