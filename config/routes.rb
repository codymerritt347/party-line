Rails.application.routes.draw do
  resources :users
  resources :friendships
  resources :statuses
  resources :parties
  resources :messages
  resources :replies

  get '/', to: 'static#welcome'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end