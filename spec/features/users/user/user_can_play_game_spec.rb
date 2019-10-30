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
      choose('question_424_true')
      click_button('Next')
    end

    within '#myModal-1' do
      choose('question_429_true')
      click_button('Next')
    end

    within '#myModal-2' do
      choose('question_430_true')
      click_button('Next')
    end

    within '#myModal-3' do
      choose('question_435_true')
      click_button('Next')
    end

    within '#myModal-4' do
      choose('question_436_true')
      click_button('Submit')
    end

    expect(current_path).to eq("/games/#{game_1.id}/end")
    expect(page).to have_content("You got 5 correct answers out of 5!!! Good job!")
    within ".games_info" do
      expect(page).to have_content(game_1.custom_name)
      expect(page).to have_content(game_1.category)
      expect(page).to have_content(game_1.difficulty)
      expect(page).to have_button("Restart Game")
      expect(page).to have_button("Go Back to My Games")
    end
  end
end
