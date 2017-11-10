class Api::ApiController < ActionController::API
  before_action :restrict_format, except: [:sign_up]

  def restrict_format
    result = {
      status:  400,
      message: "Not a valid call."
    }
    unless request.format == 'application/json'
      render_response(result)
    end
  end

  def sign_in_success_response(data, message, status = 200, access_token, employee_details)
    render(
      json: {
        data:             data,
        status:           status,
        access_token:     access_token,
        message:          message
      }
    )
  end

  def render_response(json)
    render(
      json: json
    )
  end

  def error_response(message, status = 204)
    render(
      json: {
        data:    '',
        status:  status,
        message: message
      }
    )
  end
end
