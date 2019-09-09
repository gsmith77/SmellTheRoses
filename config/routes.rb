Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'owners#new'
  resources :flowers, only: [:index, :new, :create, :destroy]
  resources :owners, only: [:new, :create, :show,]
  resources :floristries, only: [:index, :show]
  post'signin', to: "sessions#create"
  get 'signin', to: "sessions#new"
  get '/logout', to: 'sessions#destroy', as: "logout"
  get '/owners/add_flower', to: 'owners#add_flower'
  get '/flowers/add_to_user', to: 'flowers#add_to_user'

  get '/auth/facebook/callback' => 'sessions#create'
end
