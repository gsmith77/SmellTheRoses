Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'owners#new'
  resources :flowers, only: [:index, :new, :create, :destroy]
  resources :owners, only: [:new, :create, :show]
  resources :floristries, only: [:index]
  post'signin', to: "sessions#create"
  get 'signin', to: "sessions#new"
  get '/logout', to: 'sessions#destroy', as: "logout"

  get '/auth/facebook/callback' => 'sessions#create'
end
