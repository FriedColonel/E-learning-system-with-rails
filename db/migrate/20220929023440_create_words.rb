class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :origin, null: false
      t.string :hiragana, null: false
      t.text :meaning, null: false
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
