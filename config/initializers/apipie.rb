base_host = if Rails.env.production?
  "20.194.61.63"
else
  "#{`dig +short myip.opendns.com @resolver1.opendns.com`.gsub("\n", '')}:3000"
end

Apipie.configure do |config|
  config.app_name                = ENV['PROJECT_NAME']
  config.app_info                = 'API Document'
  config.api_base_url            = ''
  config.doc_base_url            = '/apipie'
  config.languages               = ['en']
  config.default_locale          = 'en'
  config.api_controllers_matcher = File.join(Rails.root, "app", "controllers", "**","*.rb")
  config.namespaced_resources    = true
  config.show_all_examples       = true
  config.swagger_api_host        = base_host
  config.reload_controllers      = false
  
#   config.authenticate = Proc.new do
#     authenticate_or_request_with_http_basic do |username, password|
#       username == ENV['API_DOCUMENT_ID'] && password == ENV['API_DOCUMENT_PASSWORD']
#     end
#   end
end
