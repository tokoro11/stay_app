Rails.application.routes.draw do
  root to: 'home#top'

  devise_for :users

  namespace :users do
    resource :profile, only: [:show, :update]
    resource :account, only: :show
  end

  resources :rooms do
    get :search, on: :collection
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :destroy]

end

