class StaticPagesController < ApplicationController

  def index
  end

  def home
    # grabbing API
    title = HTTParty.get('http://www.omdbapi.com/?s=#{params[:thetitle]}')
    year = HTTParty.get('http://www.omdbapi.com/?s=#{params[:theyear]}')

    # making accessible by ERB under a variable
    @by_title = title['Title']
    @by_year = year['Year']
  end

end
