class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.integer :empregado_id
      t.text :exp
      t.text :academic
      t.text :skills

      t.timestamps
    end
  end
end
