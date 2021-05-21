class ApplicationController < ActionController::API
  rescue_from Errors::Normal, with: :rescue_normal_error
  include JsonOutputStandard
  
  def rescue_normal_error(exception)
    standard_render_send :status_case => :error,
      message: exception.message,
      status_code: 403
  end
end
