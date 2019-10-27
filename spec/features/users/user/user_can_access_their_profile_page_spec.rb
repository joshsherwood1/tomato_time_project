require 'rails_helper'

describe 'A registered user' do
  it 'can see all tutorials marked for both classroom and non-classroom purposes' do
    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile"
    expect(page).to have_content("Game Stats")
    expect(page).to have_content("Number of Games Played")
    expect(page).to have_content("Number of Games Won")
    expect(page).to have_content("Number of Correctly Answered Questions")
    expect(page).to have_content("JoshSherwood1")
  end
end
