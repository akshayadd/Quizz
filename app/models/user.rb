class User < ApplicationRecord
  has_many :payments
  has_many :invitations

  def self.create_user_entry(user_data)
    result = {
      status:  204,
      message: ["Your are already Registered please try to Sign In"],
    }

    user = User.find_by(contact_number: user_data[:contact_number])

    if user.blank?
      user                 = User.new(contact_number: user_data[:contact_number])
      user.first_name      = user_data[:first_name]
      user.last_name       = user_data[:last_name]
      user.email           = user_data[:email]
      user.reffer_number   = user_data[:reffer_number]
      user.coins           = 0

      if user.save
        otp = Otp::GenOtp.send_otp(user.contact_number) unless user.contact_number.blank?
        if otp.present? && user.update(mobile_otp: otp)
          if user.reffer_number.present?
            refer = User.find_by(contact_number: user.reffer_number)
            refer_gem = refer.gems
            refer.update(gems: refer_gem + 1)
            user.update(gems: 1)
          end
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
    update(access_token: token)
  end

  def self.update_coins(user_data)
    result = {
      coins: [],
      status:    404,
      message:   "Not found"
    }
    user = User.find_by(id: user_data[:user_id])
    if user.present?
      coins = user.coins
      user.update(coins: coins + 5)
      result[:status]  = 200
      result[:message] = ["Success"]
      result[:coins] = user.coins
    else
      result[:message]   = user.errors.full_messages
    end
    return result
  end

  def user_details
    User.where(
      disabled: false
    ).map(&:to_json)
  end

  def name
    "#{first_name} #{last_name}"
  end
end
