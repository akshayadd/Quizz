class CreateSwipeQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :swipe_quizzes do |t|
      t.date        :added_date
      t.attachment  :image

      t.timestamps
    end
  end
end
