Tithe::Application.routes.draw do

  root :to => 'pages#home'
  resources :transactions
  resources :organizations
  resources :users
  resources :sessions, :only => [ :new, :create, :destroy ]

end
