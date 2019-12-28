Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  resources :contacts, only: [:new, :create]
  
  get "singup", to: "users#new"
  resources :users, only: [:show, :create, :edit, :update, :destroy]
end
