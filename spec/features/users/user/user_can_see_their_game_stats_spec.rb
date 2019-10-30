require 'rails_helper'

describe 'A registered user' do
  it 'can see my game stats on my profile page' do
    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    game_1 = user.games.create!(custom_name: "GeoTime", category: "Geography", number_of_questions: "5", difficulty: "easy", user: user)
    game_score_1 = user.game_score.create!(game: game_1, user: user, score: 3)

    game_2 = user.games.create!(custom_name: "HistoryTime", category: "History", number_of_questions: "7", difficulty: "medium", user: user)
    game_score_2 = user.game_score.create!(game: game_2, user: user, score: 7)

    game_3 = user.games.create!(custom_name: "MathTime", category: "Math", number_of_questions: "9", difficulty: "hard", user: user)
    game_score_3 = user.game_score.create!(game: game_3, user: user, score: 7)

    visit "/profile"

    within '.game-stats' do
      expect(page).to have_content("Game Name")
      expect(page).to have_content("My Score")
      expect(page).to have_content("Total # of Questions")
      expect(page).to have_content("% Score")

      within "#game-#{game_1.id}" do
        expect(page).to have_content(game_1.custom_name)
        expect(page).to have_content(game_1.number_of_questions)
        expect(page).to have_content(game_score_1.score)
        expect(page).to have_content('60.0')
      end

      within "#game-#{game_2.id}" do
        expect(page).to have_content(game_2.custom_name)
        expect(page).to have_content(game_2.number_of_questions)
        expect(page).to have_content(game_score_2.score)
        expect(page).to have_content('100.0')
      end

      within "#game-#{game_3.id}" do
        expect(page).to have_content(game_3.custom_name)
        expect(page).to have_content(game_3.number_of_questions)
        expect(page).to have_content(game_score_3.score)
        expect(page).to have_content('77.78')
      end

      within '.total-games-played' do
        expect(page).to have_content("Total Games Played: 3")
      end
    end
  end
end
