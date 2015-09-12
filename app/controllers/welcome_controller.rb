class WelcomeController < ApplicationController
  def index
    #@movies = Movie.all
    @movies = Tmdb::Movie.find("バケモノの子")
  end
end
