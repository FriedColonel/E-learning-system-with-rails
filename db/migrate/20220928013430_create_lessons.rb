class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
