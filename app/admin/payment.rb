ActiveAdmin.register Payment do
  menu priority: 14
  actions :index, :show
  permit_params :amount, :user_id, :payment_mode, :bank_name, :ac_number, :ifsc_number, :status

  controller do
    def payment_done
      payment = Payment.find_by_id(params[:id])
      payment.update(status: 2)
      respond_to do |format|
        format.html do
          redirect_to(
            admin_payments_path,
            notice: 'Payment was successfully done.'
          )
        end
        format.json do
          head :no_content
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :user_id
    column :amount
    column "Paytm Request" do |paytm|
      !paytm.payment_mode
    end
    column :bank_name
    column :ac_number
    column 'IFSC CODE' do |bank|
      bank.ifsc_number
    end
    column "Status" do |s|
      PAYMENT.invert[s.status].to_s.titleize
    end
    actions defaults: false do |payment|
      a 'View', href: admin_payment_path(payment)
      if payment.try(:status) != 2
        item(
          'Done',
          payment_done_path(payment),
          method: :get,
          data:{
            confirm: 'Are you sure!!! Done this payment?'
          }
        )
      end
    end
  end

  filter :amount
  filter :payment_mode
  filter :bank_name
  filter :status

  show do
    panel 'Payment' do
      attributes_table_for payment do
        row :user_id
        row :amount
        row :payment_mode
        row :bank_name
        row :ac_number
        row :ifsc_number
        row "Status" do |s|
          PAYMENT.invert[s.status].to_s.titleize
        end
      end
    end
  end
end