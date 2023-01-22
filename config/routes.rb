Rails.application.routes.draw do
namespace :api do
    namespace :v1 do
      resources :appointments
      resources :service_providers
    end
  end
end
