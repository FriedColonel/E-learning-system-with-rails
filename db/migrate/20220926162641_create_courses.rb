class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    add_column :courses, :image, :string
  end
end
