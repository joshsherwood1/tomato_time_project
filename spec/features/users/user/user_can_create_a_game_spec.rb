require 'rails_helper'

describe 'A registered user' do
  it 'can create a new game' do
    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games/new"
    name = "Nerdiest Trivia Game Ever!"

    expect(page).to have_content("Create a Game!")
    fill_in :custom_name, with: name
    select "2", from: :number_of_questions
    select "Movies", from: :category
    select "Medium", from: :difficulty
    click_button "Create Game"

    expect(current_path).to eq("/games")
    expect(page).to have_content("Movies")
    expect(page).to have_content("medium")
    expect(page).to have_content("2")
    expect(page).to have_content(name)

    game = Game.last
    expect(game.custom_name).to eq(name)
    expect(game.category).to eq("Movies")
    expect(game.difficulty).to eq("medium")
    expect(game.number_of_questions).to eq("2")

  end
end
