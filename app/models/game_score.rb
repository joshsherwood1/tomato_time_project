class GameScore < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def game_id
    game.id
  end

  def game_name
    game.custom_name
  end

  def game_total_questions
    game.number_of_questions
  end

  def game_percent_score
    score / game_total_questions.to_f * 100
  end
end
