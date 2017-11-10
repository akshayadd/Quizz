ActiveAdmin.register Payment do
  menu priority: 5
  actions :index, :show
  permit_params :amount, :user_id, :payment_mode, :bank_name, :ac_number, :ifsc_number

  index do
    selectable_column
    id_column
    column :user_id
    column :amount
    column :payment_mode
    column :bank_name
    column :ac_number
    column 'IFSC CODE' do |bank|
      bank.ifsc_number
    end
    actions
  end

  filter :amount
  filter :payment_mode
  filter :bank_name

  show do
    panel 'Payment' do
      attributes_table_for payment do
        row :user_id
        row :amount
        row :payment_mode
        row :bank_name
        row :ac_number
        row :ifsc_number
      end
    end
  end
end