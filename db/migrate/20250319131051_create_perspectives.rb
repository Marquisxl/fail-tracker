class CreatePerspectives < ActiveRecord::Migration[8.0]
  def change
    create_table :perspectives do |t|
      t.string :name
      t.text :characteristics
      t.string :quote

      t.timestamps
    end
  end
end
