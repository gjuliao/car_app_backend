Rails.application.routes.draw do
  devise_for :users
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }
    end
  end
  namespace :api do
    namespace :v1 do
      resources :cars
      resources :users, only: %w[index] do
        resources :reservations, only: %w[create index destroy]
      end
    end
end
