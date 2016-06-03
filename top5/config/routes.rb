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

post '/mresults' => 'movies#index'
get '/mresults/:imdbID' => 'movies#show'
post '/create' => 'movies#create'

post '/add_to_top' => 'movies#add_to_top'

get '/mymovies' => 'movies#user_movies'

get '/mytop5' => 'movies#my_top_5'
end
