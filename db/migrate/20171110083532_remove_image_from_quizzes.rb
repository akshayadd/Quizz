class RemoveImageFromQuizzes < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :quizzes, :image
  end
end
