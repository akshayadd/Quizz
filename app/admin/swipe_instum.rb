ActiveAdmin.register SwipeInstum do
  menu priority: 13
  actions :index, :show, :create, :new, :edit, :update, :destroy
  permit_params :added_date, :image

  controller do
    def create
      quiz = SwipeInstum.new(permitted_params[:swipe_instum])
      if quiz.save
        respond_to do |format|
          format.html do
            redirect_to(
              new_admin_swipe_instum_path,
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
    f.inputs 'Swipe Insta' do
      f.input :added_date, as: :datepicker
      f.input :image
    end
    f.actions
  end

  show do
    panel 'Swipe Insta' do
      attributes_table_for swipe_instum do
        row :added_date
        row :image do |ad|
          image_tag ad.image.url(:medium)
        end
      end
    end
  end
end
