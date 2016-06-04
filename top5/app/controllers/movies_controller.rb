class MoviesController < ApplicationController

#############################################

  def remove_from_top
    Movie.find(params[:id]).update(:top5 => false)
    redirect_to mytop5_path
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

# checking top-five in SCOPE (find in model) to stop users adding more than 5
    if current_user.movies.top_five.length >= 5
      flash[:message] = "YOUR TOP 5 LIST IS FULL! REMOVE SOME TO ADD MORE"
      redirect_to '/home'
      return
    elsif current_user.movies.top_five.length >= 4
      flash[:message] = "YOUR TOP 5 LIST IS NOW FULL... REMOVE AND ADD OTHERS IF YOU'VE MESSED IT UP"
      @pick = HTTParty.get "http://www.omdbapi.com/?i=#{params[:id]}"
      movie = Movie.new
      movie.actors = @pick['Actors']
      movie.imgurl = @pick["Poster"]
      movie.director = @pick["Director"]
      movie.imdbID = @pick["imdbID"]

      # set it to tru e by default
      movie.top5 = true
      #associate the user
      movie.user_id = current_user.id

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

      # set it to tru e by default
      movie.top5 = true
      #associate the user
      movie.user_id = current_user.id

      movie.save
      if movie.save
        flash[:message] = "YOU HAVE ADDED TO YOUR TOP 5 FIVE SUCCESSFULLY... ADD SOME MORE!"
        redirect_to '/home'
      end
    end

#############################################

  def my_top_5
    @user = User.find(current_user.id)
  end

#############################################

  def show_alltop5
    @user = User.find(current_user.id)
    # attached the user with the movies that top5 = true
    @top_movies = Movie.joins(:user).where(:top5 => true)
    # put them into a list associated with that user
    @top_movies = @top_movies.group_by {|i| i.user.username }
  end

#############################################

  def user_movies
  end

#############################################

  def home
    #   if current_user.nil?
    #   redirect_to login_path
    # end
  end


#############################################

  def update
  end

#############################################

  def destroy
  end

#############################################

end
