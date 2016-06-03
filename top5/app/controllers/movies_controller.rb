class MoviesController < ApplicationController

  def index
    # grabbing API

    @results = HTTParty.get "http://www.omdbapi.com/?s=#{params[:searchterm]}"
    @imdbID = @results['imdbID']
  end

  def show
    @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:imdbID]}"

  end

  def my_top_5

  end

  def user_movies

  end

  def add_to_top
    Movie.find(params[:id]).update(:top5 => true)
    redirect_to action: 'user_movies'
  end

  def create

# make a new request to omdb api to get the information
# from the movie again.
    @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:id]}"

    movie = Movie.new
    movie.actors = @pick['Actors']
    movie.imgurl = @pick["Poster"]
    movie.director = @pick["Director"]
    movie.top5 = false

    movie.user_id = current_user.id

    movie.save
    if movie.save
      flash[:message] = "you have added to top 5"
      redirect_to '/'
    else
      flash[:message] = "you have NOT added to top 5"
    end
  end

  def update
  end

  def destroy
  end
end
