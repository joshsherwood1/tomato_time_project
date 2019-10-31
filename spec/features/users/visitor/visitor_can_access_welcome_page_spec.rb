require 'rails_helper'

RSpec.describe "As a visitor" do

    it "I can access all of the content on the welcome page" do
      visit "/"
      expect(page).to have_content("Welcome!")
      expect(page).to have_content("About Tomato Time:")
      expect(page).to have_content("Play the trivia game of your choice!")
      expect(page).to have_content("Choose your trivia category, difficulty, and number of questions that you would like to answer.")
      expect(page).to have_content("Time to get tomato-red saucy!")
    end
  end
