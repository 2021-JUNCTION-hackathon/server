class SwaggerApiController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  # before_action :http_basic_authenticate, only: [:index]
  
  def index
    ## development swagger API, Never change this line word
    if Rails.env.development?
      redirect_to "/swagger/dist/index.html?url=/apidocs/development/schema_swagger_form_data_1621688750.json"
    end
    
    ## production swagger API, Never change this line word
    if Rails.env.production?
      redirect_to "/swagger/dist/index.html?url=/apidocs/production/schema_swagger_form_data_1621097622.json"
    end
  end
  
  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['API_DOCUMENT_ID'] && password == ENV['API_DOCUMENT_PASSWORD']
    end
  end
end
