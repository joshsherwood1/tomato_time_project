require 'rails_helper'

describe 'A registered user' do
  it 'can play the games_path and end up on game end page' do
    json_response = File.open('./spec/fixtures/trivia_data.json')
    stub_request(:get, 'https://tomato-time-api.herokuapp.com/api/v1/questions?amount=5&category=Geography&difficulty=easy').to_return(status: 200, body: json_response)

    user = User.create!(username: "User Name", email: "email@email.com", google_token: "token")
    game_1 = Game.create!(custom_name: "GeoTime", category: "Geography", number_of_questions: "5", difficulty: "easy", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games/#{game_1.id}"

    click_button('Play Game')

    within '#myModal-0' do
      click_button('Next')
    end

    within '#myModal-1' do
      click_button('Next')
    end

    within '#myModal-2' do
      click_button('Next')
    end

    within '#myModal-3' do
      click_button('Next')
    end

    within '#myModal-4' do
      click_button('Submit')
    end

    expect(current_path).to eq("/games/#{game_1.id}")
    expect(page).to have_content("Please answer all questions")
  end
end
