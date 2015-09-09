class Movie < ActiveRecord::Base
	validates :title, presence: true
	#require 'ruby-tmdb'

	
	has_many :watchlists  , foreign_key: "movie_id" , dependent: :destroy
  has_many :users , through: :watchlist
  has_many :wants, class_name: "Want", foreign_key: "movie_id", dependent: :destroy
  has_many :want_users , through: :wants, source: :user
  
  Tmdb::Api.key("b9b130879cbed0857587720aeb59bc98")
  Tmdb::Api.language("de")
  #Tmdb.api_key = "b9b130879cbed0857587720aeb59bc98"
  #Tmdb.default_language = "en"
end
