Rails.application.routes.draw do
  # resources :movies
  # resources :users
  # resources :static_pages
  # resources :sessions


root to: 'static_pages#index'


post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'


get '/signup' => 'users#new'
post '/users' => 'users#create'

get '/home' => 'static_pages#home'


get '/mresults' => 'movies#index'


end
