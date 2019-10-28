require 'rails_helper'

describe Game, :type => :model do
  describe "validations" do
    it { should validate_presence_of :category }
    it { should validate_presence_of :difficulty }
    it { should validate_presence_of :number_of_questions }
    it { should validate_presence_of :custom_name }
  end

  describe "relationships" do
      it { should belong_to(:user) }
      it { should have_many :game_score }
  end
end
