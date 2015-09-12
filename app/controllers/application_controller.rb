class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  require 'themoviedb'
  
  before_filter :set_config
  Tmdb::Api.key("b9b130879cbed0857587720aeb59bc98")
  Tmdb::Api.language("ja")
  
  def set_config
  	@configuration = Tmdb::Configuration.new
  end
  
  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
