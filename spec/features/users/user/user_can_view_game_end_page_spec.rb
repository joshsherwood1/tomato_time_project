require 'rails_helper'

describe 'A registered user' do
  it 'can see the results of the game that they played once they have answered the last question' do
    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "MathTime", category: "Math", number_of_questions: "10", difficulty: "easy", user_id: user.id)
    gamescore = GameScore.create!(user_id: user.id, game_id: game_1.id, score: 7)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games/#{game_1.id}/end"

    within ".games_info" do
      expect(page).to have_content(game_1.custom_name)
      expect(page).to have_content(game_1.category)
      expect(page).to have_content(game_1.difficulty)
      expect(page).to have_button("Restart Game")
      expect(page).to have_button("Go Back to My Games")
    end

    click_button("Go Back to My Games")
    expect(current_path).to eq("/games")
    visit "/games/#{game_1.id}/end"
    click_button("Restart Game")
    expect(current_path).to eq("/games/#{game_1.id}")
  end
end
