class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :email,                 null: false, default: ""
      t.string    :password,              null: false, default: ""
      t.integer   :coins
      t.string    :contact_number,        null: false
      t.string    :access_token,          limit: 32
      t.datetime  :mobile_otp
      t.boolean   :disabled,              null: false, default: false

      t.timestamps
    end
  end
end
