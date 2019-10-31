require 'rails_helper'

RSpec.describe GameScore, type: :model do
  describe "relationships" do
      it { should belong_to(:user) }
      it { should belong_to(:game) }
  end

  before(:each) do
    @user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @game_1 = @user.games.create!(custom_name: "GeoTime", category: "Geography", number_of_questions: "5", difficulty: "easy", user: @user)
    @game_score_1 = @user.game_score.create!(game: @game_1, user: @user, score: 3)
    @game_score_2 = @user.game_score.create!(game: @game_1, user: @user, score: 5)
  end

  describe "instance methods" do
    it "#game_id" do
      expect(@game_score_1.game_id).to eq(@game_1.id)
    end

    it "#game_name" do
      expect(@game_score_1.game_name).to eq(@game_1.custom_name)
    end

    it "#game_total_questions" do
      expect(@game_score_1.game_total_questions).to eq(@game_1.number_of_questions)
    end

    it "#game_percent_score" do
      expect(@game_score_1.game_percent_score).to eq(60.0)
    end
  end

  describe "class methods" do
    it "#aggregate_score_per_game" do
      expect(@user.game_score.aggregate_score_per_game(@game_1.id)).to eq(160)
    end

    it "#aggregate_count_per_game" do
      expect(@user.game_score.aggregate_count_per_game(@game_1.id)).to eq(2)
    end

    it "#average_score_per_game" do
      expect(@user.game_score.average_score_per_game(@game_1.id)).to eq(80)
    end
  end
end
