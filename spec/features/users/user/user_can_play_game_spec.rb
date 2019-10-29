require 'rails_helper'

describe 'A registered user' do
  it 'can play the games_path' do
    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "GeoTime", category: "Geography", number_of_questions: "5", difficulty: "easy", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games/#{game_1.id}"

    click_button('Play Game')

    #cannot get capybara to select option button
    within '#myModal-0' do

      choose('.question_424_false')
      # choose("Russia", allow_label_click: true)
      # click_on ("Russia")
      # find(:css, '.question_424_false').click
      click_button('Next')
    end

    within '#myModal-1' do
      click_button('Next')
    end

    within '#myModal-2' do
      # click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-3' do
      # click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-4' do
      # click_button('.option-1')
      click_button('Submit')
    end
  end
end
