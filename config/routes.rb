Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :campaigns, only: [:index, :show]
  end

  resources :characters do
    resources :campaigns, only: [:index, :show]
  end

  resources :campaigns

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'



end
