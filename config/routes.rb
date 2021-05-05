Rails.application.routes.draw do
  devise_for :users
  root "sessions#home"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get '/auth/:provider/callback', to: "sessions#create"
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    resources :statuses, except: [:show]
  end
  resources :parties do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end