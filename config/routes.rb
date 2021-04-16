Rails.application.routes.draw do
  resources :messages
  resources :parties
  resources :replies
  resources :tasks
  resources :users

  get '/', to: 'static#welcome'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end