class MoviesController < ApplicationController
	before_action :logged_in_user , except: [:show]
  before_action :set_movie, only: [:show]

  def new
  end
  
  def show
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
end
