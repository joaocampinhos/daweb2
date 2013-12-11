class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :empregado_id
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end
