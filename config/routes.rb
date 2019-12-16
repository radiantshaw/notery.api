Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create], path: :register
  resources :sessions, only: [:create], path: :login
  resources :notes, except: [:new, :edit]
  resources :shares, only: [:create, :destroy]

  post "/login" => "sessions#create"
end
