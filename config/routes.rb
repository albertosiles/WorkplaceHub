Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "workspaces#index"

  resources :users do
    resources :bookings
    collection do
      get :owner
    end
  end

  resources :workspaces do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update, :destroy]
resources :reviews, only: [:destroy]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :bookings do
  #   get 'calculate_total_price', on: :id
  # end
end
