class Payment < ApplicationRecord
  belongs_to :user

  def self.create_payment_request(payment_request_data)
    result = {
      status:  204,
      message: ["Your request successfully sent."],
    }

    user =  User.find_by(
                "contact_number = ? AND ",
                user_data["contact_number"]
              )

    if user.blank?
      user                      = User.find_or_initialize_by(
                                      contact_number: user_data["contact_number"]
                                    )
      user.contact_number       = user_data["contact_number"]
      user.first_name           = user_data["first_name"]
      user.last_name            = user_data["last_name"]
      user.email                = user_data["email"]
      user.password             = user_data["password"]

      if user.save
        otp = SendOtp.send_otp(user.contact_number)
        if otp && user.update(mobile_otp: otp)
          result[:status]  = 200
          result[:message] = ["Success"]
        end
      else
        result[:message]   = user.errors.full_messages
      end
    end
    return result
  end
end
