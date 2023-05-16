class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |e|
    handle_exception(e, :bad_request)
  end

  private

  def handle_exception(e, status_code)
    render json: {
      errors: [
        code: status_code.to_s.humanize,
        status: status_code,
        error: e.class.to_s,
        exception: e.message
      ],
    }, status: status_code
  end
end
