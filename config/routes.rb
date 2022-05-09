Rails.application.routes.draw do

  get 'static_pages/help'
  get 'static_pages/faq'
  get 'static_pages/about'
  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :about, only: [:index]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show]
  end
    
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
