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
    column :created_at
    actions
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