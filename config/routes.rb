Rails.application.routes.draw do
  root "sessions#home"

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :users do
    resources :statuses, shallow: true
  end
  resources :parties do
    resources :messages, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end