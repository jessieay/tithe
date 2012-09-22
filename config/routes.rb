Tithe::Application.routes.draw do


  resources  :organizations
  
  root :to => "organizations#index"


end
