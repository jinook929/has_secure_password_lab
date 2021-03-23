Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  # resources :users, only: [:show, :new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
