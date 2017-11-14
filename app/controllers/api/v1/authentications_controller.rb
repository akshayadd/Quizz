class Api::V1::AuthenticationsController < Api::ApiController
  def sign_up
    result = User.create_user_entry(params[:authentication])
    render_response(result)
  end

  #
  ## OTP through Sign In
  #
  def sign_in
    result = {
      status:  401,
      message: ["User is not authorized"]
    }

    user = User.where("contact_number = ? and disabled = false", params[:contact_number]) unless params[:contact_number].blank?

    if user.present?
      otp = Otp::GenOtp.send_otp(user.contact_number) unless user.contact_number.blank?

      if otp.present? && user.update(mobile_otp: otp)
        result[:status]  = 200
        result[:message] = ["Success"]
      end
      render_response(result)
    end
    render_response(result)
  end

  def verify_mobile_otp
    result = {
      status:        401,
      message:       ["Your Account is not Registered"]
    }
    if params[:contact_number] && params[:otp]
      user =  User.find_by(
        contact_number:  params[:contact_number],
        mobile_otp:      params[:otp],
        disabled:   false
      )
      result[:message] = "Incorrect OTP"

      if user.present? && user.update(mobile_otp: nil)
        result[:status]  = 200
        result[:message] = ["Success"]
        result[:user_details] = user.user_details
      end
    end
    render_response(result)
  end

  def request_otp
    result = {
      status:  401,
      message: 'Not a valid call'
    }
    user  = User.find_by(
      contact_number:    params[:contact_number],
      disabled: false
    )
    if user
      otp = Otp::GenOtp.send_otp(user.contact_number)
      if otp and user.update(mobile_otp: otp)
        result[:status]  = 200
        result[:message] = 'Otp successfully sent'
      else
        result[:message] = user.errors.full_messages.join(',')
      end
    end
    render_response(result)
  end

  def update_coin
    result = User.update_coins(params[:authentication])
    render_response(result)
  end
end
