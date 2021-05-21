Rails.application.routes.draw do
  get 'swagger_api/index'
  apipie
  get '/api' => 'swagger_api#index'
  get 'homes' => 'homes#index'
  get 'homes/raise' => 'homes#res_raise'
  get 'homes/fail' => 'homes#res_fail'
  
  namespace :api do
    namespace :v1 do
    end
    
    namespace :v2 do
    end
  end
end
