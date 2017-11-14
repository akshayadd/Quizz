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

  def render_response(json)
    render(
      json: json
    )
  end
end
