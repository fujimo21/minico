class MoviesController < ApplicationController
	before_action :logged_in_user , except: [:show]
  #before_action :set_movie, only: [:show]

  def new
    @movie = Movie.new
    #@movies = Tmdb::Movie.find("Jurassic World").first
    @movie = Tmdb::Movie.find("TED 2")
    #@dmovie = Tmdb::Movie.detail(315465)
  end
  
  def show
    @movie = Tmdb::Movie.detail(params[:id])
  end
  
  def create
    @movie = Movie.new(movie_params)
    @movie.save
    if @movie.save
      redirect_to new_movie_path, notice: "映画登録完了"
    else
      render 'new'
    end
  end
  
  def destory
    @movie = Movie.all
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
  
  def movie_params
    params.require(:movie).permit(:title, :tmdb_id, :poster_path)
  end
end
