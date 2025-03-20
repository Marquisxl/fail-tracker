class CreateAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :analyses do |t|
      t.text :internal_factors
      t.text :external_factors
      t.references :failure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
