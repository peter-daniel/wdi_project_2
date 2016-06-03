Rails.application.routes.draw do
  # resources :movies
  # resources :users
  # resources :static_pages
  # resources :sessions


root to: 'movies#start'


post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

post '/signup' => 'users#new'
get '/signup' => 'users#new'
post '/users' => 'users#create'

#home page
get '/start' => 'movies#start'
# search field page
get '/home' => 'movies#home'
# search results
post '/mresults' => 'movies#index'
#show details of one movie in search
get '/mresults/:imdbID' => 'movies#show'

#get info on movie and add to database
post '/create' => 'movies#create'

post '/remove_from_top' => 'movies#remove_from_top'

get '/showall' => 'movies#show_alltop5'

get '/mytop5' => 'movies#my_top_5'

end
