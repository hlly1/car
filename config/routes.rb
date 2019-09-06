Rails.application.routes.draw do
  get 'orders/new'

  root 'static_pages#index'
  get    '/signup',  to: 'users#new'
  get    '/addvehicle' ,to: 'vehicles#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/index',   to: 'static_pages#index'
  get    '/autoFind',to: 'static_pages#autoFind'
  post   '/autoFind',to: 'static_pages#autoFind'
  
  resources :users, :locations, :vehicles
end
