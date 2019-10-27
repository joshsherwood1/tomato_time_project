require 'rails_helper'

describe User, :type => :model do
  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
  end

  describe "relationships" do
    it { should have_many :games }
    it { should have_many :game_score }
  end
end
