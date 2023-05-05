Rails.application.routes.draw do
  devise_for :users
  # TODO: Define root path in case we needed it
  namespace :api do
    namespace :v1 do
      resources :cars
      resources :users do
        resources :reservations
      end
    end
  end
end
