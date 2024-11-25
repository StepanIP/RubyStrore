Rails.application.routes.draw do
  get "pages/about"
  resources :products, only: [:index, :show]
  resources :products do
    resources :reviews, only: [:create]
  end

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'

  post 'cart', to: 'carts#add_to_cart', as: 'cart'
  get 'cart', to: 'carts#show', as: 'cart_show'

  get 'account', to: 'users#account', as: 'account'

  get 'checkout', to: 'carts#checkout'
  post 'checkout', to: 'carts#process_checkout'

  Rails.application.routes.draw do
  get "pages/about"
    get 'about', to: 'pages#about'
    # Other routes...
  end

  resource :cart, only: [:show] do
    member do
      get 'remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
      get 'decrease_quantity/:id', to: 'carts#decrease_quantity', as: 'decrease_quantity'
      get 'checkout', to: 'carts#checkout', as: 'checkout'
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
