ActiveAdmin.register Invitation do
  menu priority: 6
  actions :index

  index do
    selectable_column
    id_column
    column :user_id
    column :reffer_number
    column :invitation_accept
    column :invitation_accepted_at
  end

  filter :user_id
  filter :invitation_accept

  show do
    panel 'Invitation' do
      attributes_table_for invitation do
        row :user_id
        row :reffer_number
        row :invitation_accept
      end
    end
  end

end