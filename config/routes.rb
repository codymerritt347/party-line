Rails.application.routes.draw do
  resources :plans
  resources :replies
  resources :messages
  resources :groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
