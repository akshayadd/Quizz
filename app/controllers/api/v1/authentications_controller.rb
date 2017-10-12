class Api::V1::AuthenticationsController < Api::ApiController
  before_action :check_params, except: [:sign_up]

  def sign_up
    result = User.create_user_entry(params[:user_data])
    render_response(result)
  end

  #
  ## Email through
  #
  # def sign_in
  #   user = User.find_by(
  #     email:    params[:user][:email],
  #     disabled: false
  #   )
  #   if user
  #     if user.valid_password?(params[:user][:password])
  #       user.generate_token
  #       result[:message] = 'Login Susscessfuly'
  #       result[:data] = user.user_details,
  #         result[:access_token] = user.access_token
  #       render_response(result)
  #     else
  #       error_response('User Password Not Match')
  #     end
  #   else
  #     error_response('User Not Found')
  #   end
  # end

  #
  ## OTP through
  #
  def sign_in
    result = {
      status:  401,
      message: [t('api.authentications.sign_in.alert')]
    }
    user = User.find_by(
                contact_number:    params[:contact_number],
                disabled: false
              ) unless params[:contact_number].blank?
    otp  = SendOtp.send_otp(user.contact_number) unless user.blank?

    if otp and user.update(mobile_otp: otp)
      result[:status]  = 200
      result[:message] = [t('api.authentications.sign_in.success')]
    end
    render_response(result)
  end


  def forgot_password
    user = User.find_by(
      email: params[:employee][:email],
      disabled: false
    )
    if user
      User.send_reset_password_instructions
      success_response(
        'Reset Link Send Susscessfuly',
        'Reset Link Send Susscessfuly'
      )
    else
      error_response('User Not Found')
    end
  end

  def request_otp
    result = {
      status:  401,
      message: [t('api.authentications.request_otp.alert')]
    }
    user  = User.find_by(
      contact_number:    params[:contact_number],
      disabled: false
    )
    if user
      otp = SendOtp.send_otp(user.contact_number)
      if otp and user.update(mobile_otp: otp)
        result[:status]  = 200
        result[:message] = [t('api.authentications.request_otp.success')]
      else
        result[:message] = user.errors.full_messages.join(',')
      end
    end
    render_response(result)
  end

  def check_params
    error_response('Params Not Match') if params[:user].blank?
    error_response('Email Not Found') if params[:user][:email].blank?
  end
end
