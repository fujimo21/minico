class MoviesController < ApplicationController
	before_action :logged_in_user , except: [:show]
  before_action :set_movie, only: [:show]

  def new
    @movie = Movie.new
  end
  
  def show
  end
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destory
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
  
  def movie_params
    params.require(:movie).permit(:title)
  end
end
