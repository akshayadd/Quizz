require 'send_otp'

module Otp
  class GenOtp
    def self.send_otp(phone)
      sender_id = 'Quizzes'
      otp = rand(0..9999).to_s.rjust(4,'0')
      sendotp = SendOtp::Otp.new(ENV["AUTH_KEY"])
      sendotp.send_otp(phone, sender_id, otp)
      return otp
    end

  # def self.verify_otp(phone, otp)
  #   sendotp.verify(phone, otp);
  # end
  end
end
