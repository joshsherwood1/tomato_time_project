require 'rails_helper'

describe 'A registered user' do
  it 'can see game contents on clicking start button' do
    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "BookTime", category: "Entertainment: Books", number_of_questions: "10", difficulty: "easy", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit "/games"

    within ".games" do
      within "#game-#{game_1.id}" do
        click_link("Start")
      end
    end

    expect(current_path).to eq("/games/#{game_1.id}")

    within '#question-modal' do
      expect(page).to have_content('Question')
      expect(first('.question').text).to_not be_empty
      expect(page).to have_css('.option-1')
      expect(page).to have_css('.option-2')
      expect(page).to have_css('.option-3')
      expect(page).to have_css('.option-4')
    end

    save_and_open_page

  end
end
