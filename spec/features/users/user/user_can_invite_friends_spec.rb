require 'rails_helper'

describe "invite friend" do
  it "can invite friend using valid email" do
    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    click_link "Invite a Friend"

    expect(current_path).to eq(invite_path)

    fill_in "Email", with: "mackhallidaydeveloper@gmail.com"

    click_on "Send Invite"

    expect(current_path).to eq(invite_path)

    expect(page).to have_content("Successfully sent invite!")
  end

  it "cannot invite friend with invalid email" do

    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    click_link "Invite a Friend"

    fill_in "Email", with: "mackhalliday"

    expect(page).to have_content("Please enter a valid email address")
  end

  it "cannot invite friend that already has account" do

    user = User.create!(username: "JoshSherwood1", email: "email@email.com", google_token: "yadayada")
    friend = User.create!(username: "MackHalliday", email: "mackenzie.halliday@gmail.com", google_token: "example")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/games"

    click_link "Invite a Friend"

    fill_in "Email", with: "mackenzie.halliday@gmail.com"

    expect(page).to have_content("This user is already registered on our site.")
  end
end
