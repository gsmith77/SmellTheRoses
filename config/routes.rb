Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :flowers, only: [:index, :new, :create, :destroy]
  resources :owners, only: [:new, :create, :show]
  resources :floristries, only: [:index]
end
