Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :characters, only: [:index, :show]
  end

  resources :campaigns do
    resources :characters, only: [:index, :show]
  end

  resources :characters

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'



end
