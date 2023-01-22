Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :appointments
      resources :service_providers
    end
  end
	
	post 'refresh', controller: :refresh, action: :create
	post 'login', controller: :login, action: :create
	post 'register', controller: :register, action: :create
	delete 'logout', controller: :login, action: :destroy
end
