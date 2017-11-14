ActiveAdmin.register ImageBoolean do
  menu priority: 10
  actions :index, :show, :create, :new, :edit, :update, :destroy
  permit_params :content, :answer, :option_a, :option_b, :added_date, :image

  controller do
    def create
      quiz = ImageBoolean.new(permitted_params[:image_boolean])
      if quiz.save
        respond_to do |format|
          format.html do
            redirect_to(
              new_admin_image_boolean_path,
              notice: 'Quiz is successfully created'
            )
          end
          format.json do
            head :no_content
          end
        end
      end
    end
  end

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
    f.inputs 'Image Boolean Quiz' do
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
    panel 'Image Boolean Quiz' do
      attributes_table_for image_boolean do
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