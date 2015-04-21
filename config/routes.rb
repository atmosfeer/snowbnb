Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users

  resources :users, only: [:show]

  resources :chalets, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :account do
    resource :user, only: [:show]
    resources :chalets, only: [:new, :create, :edit, :update, :destroy, :index]
    resources :bookings, only: :index
  end


end
