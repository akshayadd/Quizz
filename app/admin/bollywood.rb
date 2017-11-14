ActiveAdmin.register Bollywood do
  menu priority: 5
  actions :index, :show, :create, :new, :edit, :update, :destroy
  permit_params :content, :answer, :option_a, :option_b, :option_c, :option_d, :added_date

  controller do
    def create
      quiz = Bollywood.new(permitted_params[:bollywood])
      if quiz.save
        respond_to do |format|
          format.html do
            redirect_to(
              new_admin_bollywood_path,
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
    column :option_c
    column :option_d
    column :answer
    actions
  end

  filter :added_date
  filter :content
  filter :answer

  form do |f|
    f.inputs 'Bollywood Quiz' do
      f.input :added_date, as: :datepicker
      f.input :content
      f.input :option_a
      f.input :option_b
      f.input :option_c
      f.input :option_d
      f.input :answer
    end
    f.actions
  end

  show do
    panel 'Bollywood Quiz' do
      attributes_table_for bollywood do
        row :content
        row :option_a
        row :option_b
        row :option_c
        row :option_d
        row :answer
        row :added_date
      end
    end
  end
end