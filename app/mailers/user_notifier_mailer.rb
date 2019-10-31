class UserNotifierMailer < ApplicationMailer
  def inform(user)
    @user = user
    @digest = digest(user)
    mail(to: user.email, subject: "Daily summary for #{user.username}")
  end

  def digest(user)
    digest = []
    user.games.each do |game|
      score = user.game_score.today.average_score_per_game(game.id)
      game_result = {
        game: game.custom_name,
        count: user.game_score.aggregate_count_per_game(game.id),
        score: score
      }
      digest << game_result
    end
    digest
  end
end
