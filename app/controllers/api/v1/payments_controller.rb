class Api::V1::PaymentsController < Api::ApiController

  def payment_request
    result = Payment.create_payment_request_entry(params[:payment])
    render_response(result)
  end

  def requested_payment
    result = {
      payment:      [],
      status:        204,
      message:       ["Not requested for payment"]
    }
    result[:payment] = Payment.find_by(user_id: params[:user_id])
    render_response(result)
  end
end
