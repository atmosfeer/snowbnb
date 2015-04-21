Rails.application.routes.draw do

 resources :chalets, only: [:index, :show]
  resources :users, only: [:new, :create, :show]

  resources :chalets, only: :show do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :account do
    resources :users, only: [:edit, :update]
    resources :chalets, only: [:new, :create, :edit, :update, :destroy, :index]
    resources :bookings, only: :index
  end

  root to: "home#index"

  resources :chalets, only: [:index]
end
