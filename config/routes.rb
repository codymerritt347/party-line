Rails.application.routes.draw do
  get '/', to: "sessions#home"
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
  resources :users do
    resources :statuses
  end
  resources :friendships
  resources :parties
  resources :messages do
    resources :replies
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end