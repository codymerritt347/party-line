Rails.application.routes.draw do
  root "sessions#home"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    resources :statuses, shallow: true
    resources :messages, shallow: true
  end
  resources :parties do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end