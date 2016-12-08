Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "sessions#new"

  resources :users, only: [:new, :show, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:show, :create, :new]
  end

  resources :albums, only: [:edit, :update, :destroy] do
    resources :tracks, only: [:show, :create, :new]
  end

  resources :tracks, only: [:edit, :update, :destroy]

end
