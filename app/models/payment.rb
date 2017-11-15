class Payment < ApplicationRecord
  belongs_to :user

  def self.create_payment_request_entry(payment_request_data)
    result = {
      status:       204,
      message:      ["Your request not sent."]
    }

    user =  User.find_by("id = ? ", payment_request_data["user_id"])

    if user.present?
      payment                 = Payment.new(user_id: user.id)
      payment.amount          = payment_request_data["amount"]
      payment.status          = payment_request_data["status"]
      payment.payment_mode    = payment_request_data["payment_mode"]
      
      if payment.payment_mode == 1
        payment.bank_name     = payment_request_data["bank_name"]
        payment.ac_number     = payment_request_data["ac_number"]
        payment.ifsc_number   = payment_request_data["ifsc_number"]
      end

      if payment.save
        coin = user.coins
        user.update(coins: coin - payment.amount)
        result[:status]       = 200
        result[:message]      = ["Success"]
      else
        result[:message]   = user.errors.full_messages
      end
    end
    return result
  end
end
