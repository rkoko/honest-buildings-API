Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/me', to: 'auth#show'
      post 'users/signup', to: 'users#create'
      get '/users', to: 'users#index'
      post '/building_mgmts/signup', to: 'building_mgmts#create'
      get '/building_mgmts', to: 'building_mgmts#index'
      # get '/building_mgmts/:id' to: 'building_mgmts#show'
      get '/buildings', to: 'buildings#index'
      post '/buildings/new', to: 'reviews#create'
      get '/reviews', to: 'reviews#index'
      get '/buildings/addresses', to: 'buildings#addresses'
      # resources :reviews
      resources :buildings
      resources :building_mgmts
      # resources :users
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
