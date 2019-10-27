class Game < ApplicationRecord
  validates_presence_of :category, :difficulty, :number_of_questions, :custom_name
  belongs_to :user
end
