ActiveAdmin.register ImageQuiz do
  menu priority: 5
  actions :index, :show, :create, :new, :edit, :update, :destroy
  permit_params :content, :answer, :option_a, :option_b, :added_date, :image

  index do
    selectable_column
    id_column
    column :added_date
    column :content
    column :option_a
    column :option_b
    column :answer
    column :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    actions
  end

  filter :added_date
  filter :content
  filter :answer

  form do |f|
    f.inputs 'Image Quiz' do
      f.input :added_date, as: :datepicker
      f.input :content
      f.input :option_a
      f.input :option_b
      f.input :answer
      f.input :image
    end
    f.actions
  end

  show do
    panel 'Image Quiz' do
      attributes_table_for image_quiz do
        row :added_date
        row :content
        row :option_a
        row :option_b
        row :answer
        row :image do |ad|
          image_tag ad.image.url(:medium)
        end
      end
    end
  end
end