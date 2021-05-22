Rails.application.routes.draw do
  get 'swagger_api/index'
  apipie
  get '/api' => 'swagger_api#index'
  get 'homes' => 'homes#index'
  get 'homes/raise' => 'homes#res_raise'
  get 'homes/fail' => 'homes#res_fail'
  
  namespace :api do
    namespace :v1 do
      resources :mobilities, only: [:index] do
        collection do
          get 'from_my_position'
          get 'obstacles_base_map_guide'
        end
      end
    end
    
    namespace :v2 do
    end
  end
end
