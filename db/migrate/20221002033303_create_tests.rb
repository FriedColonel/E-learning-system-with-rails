class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :lesson, null: false, foreign_key: true
      t.time :time_limit
      t.string :name
      t.integer :min_correct_ans

      t.timestamps
    end
  end
end
