class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string      :content
      t.string      :option_a,    default: ""
      t.string      :option_b,    default: ""
      t.string      :option_c,    default: ""
      t.string      :option_d,    default: ""
      t.string      :answer,      null: false
      t.datetime    :added_date
      t.attachment  :image

      t.timestamps
    end
  end
end
