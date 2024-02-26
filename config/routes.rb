Rails.application.routes.draw do
  devise_for :users

  root to: "workspaces#index"

  resources :users
  resources :workspaces do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]

    # Custom member route for upload_image action
    post 'upload_image', on: :member
  end

  resources :bookings, only: [:index, :edit, :update, :destroy]
  resources :reviews, only: [:destroy]

  get "/my_offerings", to: "workspaces#my_offerings", as: :owner_workspaces

  get "up" => "rails/health#show", as: :rails_health_check
end
