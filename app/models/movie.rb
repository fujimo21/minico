class Movie < ActiveRecord::Base
	validates :title, presence: true
	
	has_many :watchlists  , foreign_key: "movie_id" , dependent: :destroy
  has_many :users , through: :watchlist
  has_many :wants, class_name: "Want", foreign_key: "movie_id", dependent: :destroy
  has_many :want_users , through: :wants, source: :user
  
end
