Rails.application.routes.draw do
  get '/', to: "sessions#home"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
  resources :users do
    resources :statuses, shallow: true
  end
  resources :parties do
    resources :messages
  end
  resources :replies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end