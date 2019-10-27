class User < ApplicationRecord
  validates_presence_of :username, :email
  has_many :games
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
    end
  end
end
