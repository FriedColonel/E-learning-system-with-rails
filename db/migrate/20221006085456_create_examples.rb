class CreateExamples < ActiveRecord::Migration[6.1]
  def change
    create_table :examples do |t|
      t.string :meaning, null: false
      t.string :sentence, null: false
      t.references :word, null: false, foreign_key: true
      t.string :hiragana, null: false

      t.timestamps
    end
  end
end
