require 'rails_helper'

describe 'A registered user' do
  it 'can see all their games' do
    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "MathTime", category: "Math", number_of_questions: "10", difficulty: "easy", user_id: user.id)
    game_2 = Game.create!(custom_name: "SpellingTime", category: "Spelling", number_of_questions: "20", difficulty: "hard", user_id: user.id)
    game_3 = Game.create!(custom_name: "FoodTime", category: "Food", number_of_questions: "30", difficulty: "easy", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    expect(page).to have_content("#{user.username}'s Games")

    within ".games" do
      within "#game-#{game_1.id}" do
        expect(page).to have_content(game_1.custom_name)
        expect(page).to have_content(game_1.category)
        expect(page).to have_content(game_1.number_of_questions)
        expect(page).to have_content(game_1.difficulty)
        expect(page).to have_button("Start")
        expect(page).to have_button("Delete")
      end
      within "#game-#{game_2.id}" do
        expect(page).to have_content(game_2.custom_name)
        expect(page).to have_content(game_2.category)
        expect(page).to have_content(game_2.number_of_questions)
        expect(page).to have_content(game_2.difficulty)
        expect(page).to have_button("Start")
        expect(page).to have_button("Delete")
      end
      within "#game-#{game_3.id}" do
        expect(page).to have_content(game_3.custom_name)
        expect(page).to have_content(game_3.category)
        expect(page).to have_content(game_3.number_of_questions)
        expect(page).to have_content(game_3.difficulty)
        expect(page).to have_button("Start")
        expect(page).to have_button("Delete")
      end
    end
  end

  xit 'can delete a game' do
    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "MathTime", category: "Math", number_of_questions: "10", difficulty: "easy", user_id: user.id)
    game_2 = Game.create!(custom_name: "SpellingTime", category: "Spelling", number_of_questions: "20", difficulty: "hard", user_id: user.id)
    game_3 = Game.create!(custom_name: "FoodTime", category: "Food", number_of_questions: "30", difficulty: "easy", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    within "#game-#{game_3.id}" do
      click_button("Delete")
    end
    save_and_open_page
    expect(current_path).to eq("/games")

    expect(page).to_not have_content("#{game_3.custom_name}")

    expect(page).to have_css("#game-#{game_1.id}")
    expect(page).to have_css("#game-#{game_2.id}")
  end
end
