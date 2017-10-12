# require 'send_otp'
# class SendOtp
#   def self.send_otp(phone)
#     unless phone.blank?
#       otp = rand(0..9999).to_s.rjust(4,'0')
#       gup = Gupshup::Enterprise.new(
#               userid:   ENV['gupshup_user_id'],
#               password: ENV['gupshup_password']
#             )
#       message = "Your one time password is #{otp}. Thanks for been part of DriveOn family"
#       otp_response = gup.send_text_message(
#                       msg: message,
#                       send_to: "#{+91}#{phone}"
#                     )
#       if otp_response[0] == true
#         return otp
#       end
#     end
#   end
# end


# # require 'send_otp'

# # sendotp = SendOtp::Otp.new('AuthKey')
# # sendotp.send_otp(contact_number, sender_id, otp); //otp is optional if not sent it'll be generated automatically  
# # sendotp.retry(contact_number, retry_voice);
# # sendotp.verify(contact_number, otp);