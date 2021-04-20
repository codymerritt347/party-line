Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#welcome"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  resources :users do
    resources :statuses
    resources :friendships
    resources :messages
    resources :replies
  end
  resources :friendships
  resources :parties do
    resources :messages, only: [:index, :show, :new, :create]
  end
  resources :messages do
    resources :replies, only: [:index, :show]
  end
  resources :replies
end