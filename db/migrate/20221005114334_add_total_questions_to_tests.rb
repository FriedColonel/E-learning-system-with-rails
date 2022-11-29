class AddTotalQuestionsToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :total_questions, :integer
  end
end
