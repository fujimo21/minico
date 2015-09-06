class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower
  
  has_many :watchlists , foreign_key: "user_id", dependent: :destroy
  has_many :movies ,through: :watchlists
  has_many :wants, class_name: "Want", foreign_key: "user_id", dependent: :destroy
  has_many :want_movies , through: :wants, source: :movie
  
  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following_users.include?(other_user)
  end

  
  def want(movie)
    wants.create(movie_id: movie.id)
  end

  def unwant(movie)
    wants.find_by(movie_id: movie.id).destroy
  end

  def want?(movie)
    want_movies.include?(movie)
  end
end
