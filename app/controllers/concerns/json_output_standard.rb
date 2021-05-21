module JsonOutputStandard
  extend ActiveSupport::Concern

  private
  
  def standard_render_send(
      payload: {},
      meta: {},
      message: nil,
      status_case:,
      status_code: 500
    )
    
    if status_case == :success
      res = {
        response: {
          payload: payload
        }
      }
      
      res[:response].merge!(meta: meta) if meta.any?
      
      return render :json => res,
        :status => :ok
    elsif status_case == :error
      res = {
        errors: {
          message: message
        }
      }
      
      res[:errors].merge!(meta: meta) if meta.any?
      
      return render :json => res,
        :status => status_code
    end
  end
end