Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "workspaces#index"

  resources :users

  resources :workspaces do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy]
  resources :reviews, only: [:destroy]

  get "/my_offerings", to: "workspaces#my_offerings", as: :owner_workspaces


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :bookings do
  #   get 'calculate_total_price', on: :id
  # end
end
