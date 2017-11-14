class UpdateMobileOtpType < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :mobile_otp, :string
  end
end
