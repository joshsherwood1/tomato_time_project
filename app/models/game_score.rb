require 'date'

class GameScore < ApplicationRecord
  belongs_to :game
  belongs_to :user

  scope :today, -> { where("created_at >= NOW() - INTERVAL '24 HOURS'") }
  scope :by_game, -> (game_id) { where(game_id: game_id) }

  def self.average_score_per_game(id)
    return 0 if self.aggregate_score_per_game(id) == 0
    (aggregate_score_per_game(id).to_f / aggregate_count_per_game(id)).round(2)
  end

  def self.aggregate_count_per_game(id)
    self.by_game(id).count
  end

  def self.aggregate_score_per_game(id)
    self.by_game(id).map { |game| game.game_percent_score }.sum
  end

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
