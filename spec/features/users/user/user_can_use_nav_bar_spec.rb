require 'rails_helper'

describe 'user navigation bar' do
  it 'can use all links' do
    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    click_link "Profile"

    expect(current_path).to eq("/profile")

    click_link "My Games"

    expect(current_path).to eq("/games")
  end

  it 'can logout' do
    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    click_link "Logout"

    expect(current_path).to eq("/")
    expect(page).to have_content("You have been logged out! Come play again soon!")
  end
end
