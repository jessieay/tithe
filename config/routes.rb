Tithe::Application.routes.draw do

  root :to => 'pages#home'
  resources :transactions
  resources  :organizations


end
