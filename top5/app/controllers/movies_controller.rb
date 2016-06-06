class MoviesController < ApplicationController

#############################################

  def remove_from_top
    # CHANGE TOP-5 BOOLEAN TO FALSE - REMOVES IT FROM LIST
    Movie.find(params[:id]).update(:top5 => false)
    redirect_to mytop5_path
    # flash[:message] = "."
  end

#############################################

  def index
    # passing user search input into API
    @results = HTTParty.get "http://www.omdbapi.com/?s=#{params[:searchterm]}"
    # grabing the unique movie code for show action
    @imdbID = @results['imdbID']

  end

#############################################

  def show
    # passing chosen movie code into API imdbID search
    @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:imdbID]}"
  end

#############################################

  def create
  # checking "top-five" as defined in SCOPE (find this in movie.rb) stops users adding more than 5 movies
  if current_user.movies.top_five.length >= 5
    # if list is full flash message and do nothing
    flash[:message] = "YOUR TOP 5 LIST IS FULL! REMOVE SOME TO ADD MORE."
    redirect_to '/home'
    return
  elsif current_user.movies.top_five.length >= 4
    #this elsif tells the user not to add any more AFTER this one.

    # make a new request to omdb api to get the information from the movie again.
    @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:id]}"
    movie = Movie.new
    movie.actors = @pick['Actors']
    movie.imgurl = @pick["Poster"]
    movie.director = @pick["Director"]
    movie.imdbID = @pick["imdbID"]
    # set top5 to true by default
    movie.top5 = true
    #associate the user
    movie.user_id = current_user.id
    flash[:message] = "YOUR LIST IS COMPLETE!"
    movie.save
    redirect_to '/home'
    return
  end

    # make a new request to omdb api to get the information from the movie again.
    @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:id]}"
    movie = Movie.new
    movie.actors = @pick['Actors']
    movie.imgurl = @pick["Poster"]
    movie.director = @pick["Director"]
    movie.imdbID = @pick["imdbID"]

    # set top5 to true by default
    movie.top5 = true
    # associate the user
    movie.user_id = current_user.id

    movie.save
    if movie.save
      flash[:message] = "YOU HAVE ADDED TO YOUR TOP 5 FIVE... ADD SOME MORE!"
      redirect_to '/home'
    end
  end

#############################################

  def my_top_5
    # get current user and and pass it to the view
    @user = User.find(current_user.id)
  end

#############################################

  def show_alltop5
    @user = User.find(current_user.id)
    # CROSS DB stuff  - attaches the user with the movies that have top5 = true
    @top_movies = Movie.joins(:user).where(:top5 => true)
    # put them into a list associated with that user - via helper function
    @top_movies = @top_movies.group_by {|i| i.user.username }
  end

#############################################

  def user_movies
  end

#############################################

  def home
  end

#############################################

  def update
  end

#############################################

  def destroy
  end

#############################################

end
