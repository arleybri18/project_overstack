class RemoveQuestionIdToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :question_id, :integer
  end
end
