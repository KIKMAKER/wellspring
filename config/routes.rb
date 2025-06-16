Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'drops', to: 'pages#drops', as: :drops

  resources :deliveries, only: [:index]
  resources :invoices, only: [:show]

  namespace :driver do
    resource :dashboard, only: :show
    resources :delivery_days, only: [:show] do
      member do
        patch :start_day
        patch :end_day
      end
    end
  end

  namespace :admin do
    resources :users
    resources :delivery_days do
      resources :deliveries, only: [:index, :edit, :update]
    end
    resources :invoices, only: [:index, :show]
    resources :payments, only: [:index, :show]
  end
end
