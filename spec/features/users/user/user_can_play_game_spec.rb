require 'rails_helper'

describe 'A registered user' do
  it 'can play the games_path' do
    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "BookTime", category: "Entertainment: Books", number_of_questions: "5", difficulty: "easy", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games/#{game.id}"

    expect(page).to have_button('Play Game')

    within '#myModal-0' do
      click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-1' do
      click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-2' do
      click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-3' do
      click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-4' do
      click_button('.option-1')
      click_button('Next')
    end

    within '#myModal-5' do
      click_button('.option-1')
      click_button('Submit')
    end
    
  end
end
