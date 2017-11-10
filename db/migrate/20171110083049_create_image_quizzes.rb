class CreateImageQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :image_quizzes do |t|
      t.string      :content
      t.attachment  :image
      t.string      :option_a,    default: ""
      t.string      :option_b,    default: ""
      t.string      :answer,      null: false
      t.date        :added_date

      t.timestamps
    end
  end
end
