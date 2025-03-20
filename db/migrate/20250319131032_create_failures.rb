class CreateFailures < ActiveRecord::Migration[8.0]
  def change
    create_table :failures do |t|
      t.string :title
      t.text :description
      t.date :date
      t.text :lessons_learned
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
