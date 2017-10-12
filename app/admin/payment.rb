ActiveAdmin.register Payment do
  menu priority: 5
  permit_params :amount, :user_id, :payment_mode, :bank_name, :ac_number, :ifsc_number

  index do
    selectable_column
    id_column
    column :user_id
    column :amount
    column :payment_mode
    column :bank_name
    column :ac_number
    column :ifsc_number
    actions
  end

  filter :amount
  filter :payment_mode
  filter :bank_name

end