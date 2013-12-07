class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.integer :empregado_id
      t.integer :amigo_id
      t.boolean :pendente

      t.timestamps
    end
  end
end
