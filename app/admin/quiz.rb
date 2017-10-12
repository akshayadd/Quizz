ActiveAdmin.register Quiz do
  menu priority: 4
  # actions :index, :show, :create, :new, :edit, :update, :destroy
  permit_params :content, :answer, :option_a, :option_b, :option_c, :option_d, :added_date, :image

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
    column :image
    actions
  end

  filter :added_date
  filter :content
  filter :answer
  filter :option_a
  filter :option_b
  filter :option_c
  filter :option_d

  form do |f|
    f.inputs 'Quiz' do
      f.input :added_date
      f.input :content
      f.input :option_a
      f.input :option_b
      f.input :option_c
      f.input :option_d
      f.input :answer
      f.input :image
    end
    f.actions
  end

  show do
    panel 'Quiz' do
      attributes_table_for quiz do
        row :content
        row :option_a
        row :option_b
        row :option_c
        row :option_d
        row :answer
        row :added_date
        row :image
      end
    end
  end

  # controller do
  #   def create
  #     quiz = Quiz.new(permitted_params[:quiz])
  #     if quiz.save
  #       respond_to do |format|
  #         format.html do
  #           redirect_to(
  #             admin_quizzes_path(params[:id]),
  #             notice: 'Quiz is successfully created'
  #           )
  #         end
  #         format.json do
  #           head :no_content
  #         end
  #       end
  #     end

  #     def destroy
  #       @quiz = Quiz.find_by_id(params[:id])
  #       @quiz.destroy
  #       respond_to do |format|
  #         format.html do
  #           redirect_to(
  #             admin_quizzes_path,
  #             notice: 'Quiz was successfully destroyed.'
  #           )
  #         end
  #         format.json do
  #           head :no_content
  #         end
  #       end
  #     end
  #   end
  # end
end