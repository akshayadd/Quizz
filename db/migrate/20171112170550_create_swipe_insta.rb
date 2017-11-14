class CreateSwipeInsta < ActiveRecord::Migration[5.1]
  def change
    create_table :swipe_insta do |t|
      t.date        :added_date
      t.attachment  :image

      t.timestamps
    end
  end
end
