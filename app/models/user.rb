class User < ApplicationRecord
  validates_presence_of :username, :email
  has_many :games
  has_many :game_score, :dependent => :destroy

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.save
    end
  end

  def self.already_user?(friend_email)
    User.exists?(email: friend_email)
  end

  def total_games_played
    game_score.count
  end
end
