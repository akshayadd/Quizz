class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal     :amount,     precision: 4, scale: 2
      t.integer     :user_id
      t.boolean     :payment_mode
      t.string      :bank_name,         default: ''
      t.string      :ac_number,         default: ''
      t.string      :ifsc_number,       default: ''

      t.timestamps
    end
  end
end
