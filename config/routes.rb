Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  resources :contacts, only: [:new, :create]
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "singup", to: "users#new"
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  
  resources :spots, only: [:index, :show]
end
