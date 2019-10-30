require 'rails_helper'

describe User, :type => :model do
  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
  end

  describe "relationships" do
    it { should have_many :games }
    it { should have_many :game_score }
  end

  describe "instance methods" do
    it "#total_games_played" do
      user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @game_1 = user.games.create!(custom_name: "GeoTime", category: "Geography", number_of_questions: "5", difficulty: "easy", user: user)
      @game_score_1 = user.game_score.create!(game: @game_1, user: user, score: 3)
      @game_2 = user.games.create!(custom_name: "HistoryTime", category: "History", number_of_questions: "7", difficulty: "medium", user: user)
      @game_score_2 = user.game_score.create!(game: @game_2, user: user, score: 7)

      expect(user.total_games_played).to eq(2)
    end
  end
end
