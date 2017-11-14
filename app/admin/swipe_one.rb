ActiveAdmin.register SwipeOne do
  menu priority: 12
  actions :index, :show, :create, :new, :edit, :update, :destroy
  permit_params :added_date, :image

  controller do
    def create
      quiz = SwipeOne.new(permitted_params[:swipe_one])
      if quiz.save
        respond_to do |format|
          format.html do
            redirect_to(
              new_admin_swipe_one_path,
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
    column :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    actions
  end

  filter :added_date

  form do |f|
    f.inputs 'Swipe One Quiz' do
      f.input :added_date, as: :datepicker
      f.input :image
    end
    f.actions
  end

  show do
    panel 'Swipe One Quiz' do
      attributes_table_for swipe_one do
        row :added_date
        row :image do |ad|
          image_tag ad.image.url(:medium)
        end
      end
    end
  end
end
