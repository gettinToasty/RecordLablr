Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "sessions#new"

  resources :users, only: [:new, :show, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :bands

  resources :albums, only: [:new, :create, :edit, :update, :destroy, :show]

  resources :tracks, only: [:new, :create, :edit, :update, :destroy, :show]

end
