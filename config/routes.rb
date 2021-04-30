Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#welcome"
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "users#new", as: 'signup'
  post 'login', to: "sessions#new", as: 'login'
  post 'logout', to: "sessions#destroy", as: 'logout'

  resources :users do
    resources :statuses
  end
  resources :friendships
  resources :parties
  resources :messages do
    resources :replies
  end
end