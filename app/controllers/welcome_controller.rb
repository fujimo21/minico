class WelcomeController < ApplicationController
  def index
    @movies = Movie.all
    #@movies = Tmdb::Movie.find("バケモノの子")
    @movies = Tmdb::Movie.find("TED 2")
  end
end
