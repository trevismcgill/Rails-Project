Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/characters/search', :to => 'characters#index'
  resources :users do
    resources :characters, :only => [:index, :show]
  end

  resources :campaigns do
    resources :characters, :only => [:index, :show, :new]
  end

  resources :characters

  get '/home', :to => 'static#home'
  get '/login', :to => 'sessions#new'
  post '/login', :to => 'sessions#create_by_login'
  get '/auth/github/callback', :to => 'sessions#create_by_omniauth'
  delete 'logout', :to => 'sessions#destroy'
  get '/users/:user_id/campaigns', :to => 'campaigns#index', :as => 'user_campaigns'




end
