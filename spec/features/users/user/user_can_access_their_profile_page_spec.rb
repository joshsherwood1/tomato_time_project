require 'rails_helper'

describe 'A registered user' do
  before(:each) do
    @user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/profile"
  end

  it 'can see their profile page' do
    expect(page).to have_content("#{@user.username}'s Game Stats")

    within '.game-stats' do
      expect(page).to have_content("Game Name")
      expect(page).to have_content("My Score")
      expect(page).to have_content("Total # of Questions")
      expect(page).to have_content("% Score")
      expect(page).to have_content("Total Games Played: 0")
    end
  end
end
