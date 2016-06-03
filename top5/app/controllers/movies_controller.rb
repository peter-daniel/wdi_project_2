class MoviesController < ApplicationController

#############################################

  def remove_from_top
    Movie.find(params[:id]).update(:top5 => false)
    redirect_to action: 'user_movies'
  end

#############################################

  def index
    # grabbing API
    @results = HTTParty.get "http://www.omdbapi.com/?s=#{params[:searchterm]}"
    @imdbID = @results['imdbID']
  end

#############################################

  def show
    @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:imdbID]}"
  end

#############################################

    def create
  # make a new request to omdb api to get the information from the movie again.
      @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:id]}"

      movie = Movie.new
      movie.actors = @pick['Actors']
      movie.imgurl = @pick["Poster"]
      movie.director = @pick["Director"]
      movie.imdbID = @pick["imdbID"]
      movie.top5 = true

      movie.user_id = current_user.id

      movie.save
      if movie.save
        flash[:message] = "you have added to top 5"
        redirect_to '/mresults'
      else
        flash[:message] = "you have NOT added to top 5"
      end
    end

#############################################

  def my_top_5
    @user = User.find(current_user.id)

    @top_movies = Movie.joins(:user).where(:top5 => true)
    @top_movies = @top_movies.group_by {|i| i.user.username}



  end



#############################################

  def user_movies
  end

#############################################

  def start
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
