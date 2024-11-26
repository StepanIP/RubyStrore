Rails.application.routes.draw do
  get "pages/about"
  resources :products, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
  end

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  resources :orders, only: [:create, :show]

  post 'cart', to: 'carts#add_to_cart', as: 'cart'
  get 'cart', to: 'carts#show', as: 'cart_show'

  get 'account', to: 'users#account', as: 'account'

  get 'checkout', to: 'carts#checkout'
  post 'checkout', to: 'carts#process_checkout'

  # config/routes.rb
  resources :carts do
    post 'update_quantity', on: :member
  end

  resource :cart, only: [:show] do
    member do
      get 'remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
      get 'decrease_quantity/:id', to: 'carts#decrease_quantity', as: 'decrease_quantity'
      get 'checkout', to: 'carts#checkout', as: 'checkout'
    end
  end

  get 'about', to: 'pages#about'
end