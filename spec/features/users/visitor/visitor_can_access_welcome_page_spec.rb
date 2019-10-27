require 'rails_helper'

RSpec.describe "As a visitor" do

    it "I can access all of the content on the welcome page" do
      visit "/"
      expect(page).to have_content("Welcome!")
      expect(page).to have_content("About Tomato Time:")
      expect(page).to have_content("You can play all sorts of trivia games with your friends!")
    end
  end
