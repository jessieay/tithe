Tithe::Application.routes.draw do

  root :to => 'pages#home'

  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  resources :transactions
  resources :organizations
  resources :users
  resources :sessions, :only => [ :create ]

end
