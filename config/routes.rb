Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#welcome"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  resources :users do
    resources :statuses
    resources :messages
  end
  resources :friendships
  resources :parties
  resources :messages do
    resources :replies
  end
end