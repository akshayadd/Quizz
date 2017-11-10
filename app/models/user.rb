class User < ApplicationRecord
  has_many :payments
  has_many :invitations

  def self.create_user_entry(user_data)
    result = {
      status:  204,
      message: ["Your are already Registered please try to Sign In"],
    }

    user = User.find_by("contact_number = ?", user_data["contact_number"])

    if user.blank?
      user                 = User.new(contact_number: user_data["contact_number"])
      user.first_name      = user_data["first_name"]
      user.last_name       = user_data["last_name"]
      user.email           = user_data["email"]
      user.contact_number  = user_data["contact_number"]

      if user.save
        otp = SendOtp.send_otp(user.contact_number)
        if otp.present? && user.update(mobile_otp: otp)
          result[:status]  = 200
          result[:message] = ["Success"]
        end
      else
        result[:message]   = user.errors.full_messages
      end
    end
    return result
  end

  def generate_token
    token = Digest::MD5.hexdigest(
              "#{Time.now.to_i} #{rand(0..9999).to_s.rjust(4, '0')} #{SecureRandom.hex(10)}"
            )
    update(
      access_token: token
    )
  end

  def user_details
    User.where(
      disabled: false
    ).map(&:to_json)
  end
end
