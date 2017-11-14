class CreateMovieQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_quizzes do |t|
      t.string      :content
      t.string      :option_a,    default: ""
      t.string      :option_b,    default: ""
      t.string      :answer,      null: false
      t.date        :added_date

      t.timestamps
    end
  end
end
