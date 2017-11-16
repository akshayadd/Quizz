ActiveAdmin.register User do
  menu priority: 3
  actions :index, :show, :edit, :update

  permit_params(
    :first_name,
    :last_name,
    :email,
    :password,
    :coins,
    :gems
  )

  controller do
    def destroy
      @user = User.find_by_id(params[:id])
      @user.update(disabled: true)
      respond_to do |format|
        format.html do
          redirect_to(
            admin_users_path,
            notice: 'User was successfully destroyed.'
          )
        end
        format.json do
          head :no_content
        end
      end
    end
  end

  filter :first_name
  filter :last_name
  filter :email

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :coins
    column :contact_number
    column :gems
    column "Active" do |u|
      !u.disabled
    end
    actions defaults: false do |user|
      a 'View', href: admin_user_path(user)
      a 'Edit', href: edit_admin_user_path(user)
      item(
        'Disable',
        admin_user_path(user),
        method: :delete,
        data:{
          confirm: 'Are you sure you want to delete this Content?'
        }
      )
    end
  end

  form do |f|
    f.inputs 'User' do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end

  show do
    panel 'User' do
      attributes_table_for user do
        row :first_name
        row :last_name
        row :email
        row :coins
        row :gems
        row :contact_number
      end
    end
  end
end