desc "This task is called by the Heroku scheduler add-on"
task :send_digest => :environment do
  User.all.each do |user|
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
    
    puts "Sending daily summaries to #{user.username}"
    SummarySenderJob.perform_later(user, digest)
  end
  puts "done."
end

# message looks something like this:
# Hi username! Here is a daily summary of your game scores from Tomato Time.
# You played #{this game} {#} times and got an average score of #{score}.
# Click here to play another game!
