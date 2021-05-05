Rails.application.routes.draw do
  root "sessions#home"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  get '/auth/github/callback', to: "sessions#github"
  resources :users do
    resources :statuses, except: [:show]
  end
  resources :parties do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end