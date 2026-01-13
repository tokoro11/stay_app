Rails.application.routes.draw do
  root to: 'home#top'
  resources :rooms do
    get :search, on: :collection
  end
  resources :rooms
  
  

  namespace :users do
    resource :profile, only: [:show, :update]
    resource :account, only: :show
  end

  devise_for :users
  resources :checks, only: [:index, :new, :create, :show] do
    get :confirm, on: :collection
    get :back, on: :collection
    get :complete, on: :collection
  end
# get '/check/confirm'
#   get 'check/new' # 入力画面
#  #
# post 'check/back' # 確認画面から「入力画面に戻る」をクリックしたとき
# post 'check/complete' # 完了画面
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lives do
    get :search, on: :collection
  end
end
