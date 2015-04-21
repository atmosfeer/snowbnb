Rails.application.routes.draw do

  devise_for :users, only: []

  resources :chalets, only: [:index, :show]
  resources :users, only: [:new, :create, :show]

  resources :chalets, only: :show do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :account do
    resources :users, only: [:edit, :update, :show]
    resources :chalets, only: [:new, :create, :edit, :update, :destroy, :index]
    resources :bookings, only: :index
  end

  root to: "home#index"
end
