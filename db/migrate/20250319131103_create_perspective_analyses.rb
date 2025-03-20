class CreatePerspectiveAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :perspective_analyses do |t|
      t.text :content
      t.references :failure, null: false, foreign_key: true
      t.references :perspective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
